import flet as ft

from xiloeditor import XiloEditor


def main(page: ft.Page):
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

    page.add(
        ft.Container(expand=True,
            content=XiloEditor(
                expand=True,
            ),
            alignment=ft.alignment.center
        )
    )


ft.app(main)
