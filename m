Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F404E219A15
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jul 2020 09:36:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2894C36B2A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jul 2020 07:36:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9912DC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 07:36:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0697S6kq032144; Thu, 9 Jul 2020 09:35:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9UbEg5Y/kwKTkKmnG1d4SMwVujALkM7aNFzmW/i7MaQ=;
 b=sSCSXrqbdxUXhh4mdoUwXS7ilK+CpeSOhvAIcAFUitmucGC7ISXdeG72mwqepZyy675T
 1BArDl24q4uaB5tEw2HR493K4S6pCw8x5YrEkzP167nD1e4TWsKjDiU2ym729QuOwaZa
 WbmLEXpdih76UKsqo7XfnAl9MgwpfgvugJwwZ0ZWiImn1PKJRArbltKae7augNTuae+h
 oLwP065YBuszWE8GIjns7ojgfkz422s0qRfYag2LqlNOYIP+DmPQPgwLul0XnGHU1ugM
 v8E249stIWc5QL6A/+oyCJZW9BPJlOejl7hHabfa3KUwDas6PoP8va5vCv/J5yOm75hW WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k3wu2yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 09:35:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB04010002A;
 Thu,  9 Jul 2020 09:35:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A1A52222BC;
 Thu,  9 Jul 2020 09:35:43 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 09:35:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Jul 2020 09:35:43 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v6] ARM: dts: stm32: add seeed studio odyssey-stm32mp157c
 board
Thread-Index: AQHWVVEcVMr4OGe+ZU+HPIGC88IKr6j+26ow
Date: Thu, 9 Jul 2020 07:35:42 +0000
Message-ID: <7da64e599c28432693425bb4d2c4d66b@SFHDAG6NODE3.st.com>
References: <20200708174906.41280-1-marcin.sloniewski@gmail.com>
 <20200708175622.42669-1-marcin.sloniewski@gmail.com>
In-Reply-To: <20200708175622.42669-1-marcin.sloniewski@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_04:2020-07-08,
 2020-07-09 signatures=0
Cc: Baruch Siach <baruch@tkos.co.il>, Josip Kelecic <josip.kelecic@sartura.hr>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v6] ARM: dts: stm32: add seeed studio
 odyssey-stm32mp157c board
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marcin,

> From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> Sent: mercredi 8 juillet 2020 19:56
> 
> This commit adds device tree files supporting SBC from Seeed Studio based on
> STM32MP157C.
> 
> This works with generic stm32mp1 config.
> Right now only booting from SD card is supported.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> ---
> 
> Changes in v6:
> - forgot to add changes in v5 ;(
> 
> Changes in v5:
> - removed description of PLL1 which is now handled by OPP info
> - removed cd-gpio for sdmmc1 since it is not yet supported
> 
> Changes in v4:
> - removed unnecessary pull up on uart4 rx
> 
> Changes in v3:
> - changed name of dts files from odyssey-stm32mp157c...
>   to stm32mp157c-odyssey...
> - removed usbotg node config
> - add new board in dts/Makefile in alphabetical order
> 
> Changes in v2:
> - removed `st,adc_usb_pd` from config since that
>   adc connection is non-existent which caused
>   warning or hang during boot
> 
>  arch/arm/dts/Makefile                         |   1 +
>  .../dts/stm32mp157c-odyssey-som-u-boot.dtsi   | 125 ++++++
>  arch/arm/dts/stm32mp157c-odyssey-som.dtsi     | 364 ++++++++++++++++++
>  arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi  |  58 +++
>  arch/arm/dts/stm32mp157c-odyssey.dts          | 161 ++++++++
>  5 files changed, 709 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey-som.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey.dts
> 

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
