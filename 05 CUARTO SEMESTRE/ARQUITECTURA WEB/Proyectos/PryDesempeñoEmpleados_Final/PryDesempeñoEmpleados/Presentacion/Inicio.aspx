<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/PaginaPrincipal.Master" AutoEventWireup="true" 
CodeBehind="Inicio.aspx.cs" Inherits="PryDesempeñoEmpleados.Presentacion.Inicio"%>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/Galeria.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <asp:Panel ID="Panel1" runat="server" Height="350px" >
    
     <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" 
         ClientInstanceName="ImageSlider" EnableTheming="False" 
        NavigateUrlFormatString="javascript:void({0});" Height="100%" Width="100%" 
         ForeColor="White">
        <SettingsImageArea ImageSizeMode="ActualSizeOrFit" NavigationButtonVisibility="None"
            ItemTextVisibility="Always" EnableLoopNavigation="true" />
        <SettingsNavigationBar Mode="Dots" />
        <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="false" PausePlayingWhenMouseOver="false" PlayPauseButtonVisibility="Faded"></SettingsSlideShow>
        <Items>
            <dx:ImageSliderItem ImageUrl="Galeria/1.jpg"
                NavigateUrl="1"/>
            <dx:ImageSliderItem ImageUrl="Galeria/2.jpg"
                NavigateUrl="2"/>
            <dx:ImageSliderItem ImageUrl="Galeria/3.jpg"
                NavigateUrl="3"/>
            <dx:ImageSliderItem ImageUrl="Galeria/4.jpg"
                NavigateUrl="4"/>
            <dx:ImageSliderItem ImageUrl="Galeria/5.jpg"
                NavigateUrl="5"/>
        </Items>
        <Styles>
            <ImageArea Width="100%" Height="100%" />
        </Styles>
         <BackgroundImage HorizontalPosition="center" Repeat="NoRepeat" />
    </dx:ASPxImageSlider>
    </asp:Panel>
</asp:Content>

