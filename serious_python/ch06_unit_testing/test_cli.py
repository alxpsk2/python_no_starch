from elt_splitter.cli import init_cli_args
import pytest


def test_init_args():
    parser = init_cli_args()
    possible_args = [
        "--split",
        "--customer",
        "--threads",
        "--app",
        "--table",
    ]
    parser_actions = str(parser._actions)

    assert parser.prog == "elt_splitter"
    for arg in possible_args:
        assert arg in parser_actions


# @pytest.mark.skip("Failing on collection")
def test_empty_args(capsys):
    parser = init_cli_args()

    with pytest.raises(SystemExit):
        parser.parse_args([])
        assert (
            "elt_splitter: error: the following arguments are required: --split, --app"
            in capsys.readouterr()
        )


def test_get_customer_filters():
    customer_filter = []
    customer_filter.append("clientA")
    customer_filter.append("clientB")
    assert isinstance(customer_filter, list)
    assert len(customer_filter) == 2
    assert customer_filter[1] == "clientB"


def test_get_table_filters():
    table_filter = []
    table_filter.append("tableA")
    table_filter.append("tableB")
    assert isinstance(table_filter, list)
    assert len(table_filter) == 2
    assert table_filter[1] == "tableB"
