Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743A15BA89
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 09:11:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9611C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 08:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 235A0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 08:11:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D82c7S001681; Thu, 13 Feb 2020 09:11:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GxxMm8ymdRs+XwcOPCHMfINO1IZbyHAic1NF2M8t8Z0=;
 b=HC/RHNQ5OTT/XDv0t6JHCgl9A0NV4odjS796Mq5i1j9D+LcQS3EKTUAqutuSlxLNKZ6K
 jLeAcFh42t2JoykkjxLPuyoSrldCe+K5XgYni6ToLzKNDbanGuv4NcWo+ehpZXU72Ryy
 abablM9Ulh6oqkW2PbXsLhUuVrAaB46veFkfFaALPRVyaKkNhDcqQTcF9ol1pnasVPKv
 I9rkdPqhLfywdE28uCE6/Zhg0vaxwOJN84tq8KNM/bZ1cgFLELHACJEXvDnHv63crgCi
 5xUXrKGZ71ChUlPkPgEd6jlWNxWlsY4sd6zdEKuISgp4qXEyCZKHi2LmgEfZKQKmuJ4h CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhknqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 09:11:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B755F10002A;
 Thu, 13 Feb 2020 09:11:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9018220BD3;
 Thu, 13 Feb 2020 09:11:37 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 13 Feb
 2020 09:11:37 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 09:11:37 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/9] ARM: dts: stm32mp1: DT alignment with
 kernel v5.4
Thread-Index: AQHV4kU29+WMNPBivkOPw23AJWTkig==
Date: Thu, 13 Feb 2020 08:11:37 +0000
Message-ID: <ec46854a-11b2-46a8-a627-3bf31eee5116@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128091106.28552-2-patrick.delaunay@st.com>
In-Reply-To: <20200128091106.28552-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <F41CAA4F067DC74D83626FD85C8ACA26@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Christophe KERELLO <christophe.kerello@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] ARM: dts: stm32mp1: DT alignment with
 kernel v5.4
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


On 1/28/20 10:10 AM, Patrick Delaunay wrote:
> Device tree and binding alignment with kernel v5.4
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157-pinctrl.dtsi             | 8 ++++----
>  arch/arm/dts/stm32mp157c-ev1.dts                 | 5 ++---
>  arch/arm/dts/stm32mp157c.dtsi                    | 4 ++--
>  doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt | 6 ++++--
>  4 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> index 0d53396119..07cd0809ff 100644
> --- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
> @@ -622,13 +622,13 @@
>  						 <STM32_PINMUX('F', 6, AF9)>; /* QSPI_BK1_IO3 */
>  					bias-disable;
>  					drive-push-pull;
> -					slew-rate = <3>;
> +					slew-rate = <1>;
>  				};
>  				pins2 {
>  					pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
>  					bias-pull-up;
>  					drive-push-pull;
> -					slew-rate = <3>;
> +					slew-rate = <1>;
>  				};
>  			};
>  
> @@ -650,13 +650,13 @@
>  						 <STM32_PINMUX('G', 7, AF11)>; /* QSPI_BK2_IO3 */
>  					bias-disable;
>  					drive-push-pull;
> -					slew-rate = <3>;
> +					slew-rate = <1>;
>  				};
>  				pins2 {
>  					pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
>  					bias-pull-up;
>  					drive-push-pull;
> -					slew-rate = <3>;
> +					slew-rate = <1>;
>  				};
>  			};
>  
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index 89d29b50c3..aa5892b156 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -189,8 +189,8 @@
>  		clocks = <&clk_ext_camera>;
>  		clock-names = "xclk";
>  		DOVDD-supply = <&v2v8>;
> -		powerdown-gpios = <&stmfx_pinctrl 18 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&stmfx_pinctrl 19 GPIO_ACTIVE_LOW>;
> +		powerdown-gpios = <&stmfx_pinctrl 18 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> +		reset-gpios = <&stmfx_pinctrl 19 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
>  		rotation = <180>;
>  		status = "okay";
>  
> @@ -223,7 +223,6 @@
>  
>  			joystick_pins: joystick {
>  				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
> -				drive-push-pull;
>  				bias-pull-down;
>  			};
>  
> diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
> index 41aea75213..28a7e4c08a 100644
> --- a/arch/arm/dts/stm32mp157c.dtsi
> +++ b/arch/arm/dts/stm32mp157c.dtsi
> @@ -939,7 +939,7 @@
>  			interrupt-names = "int0", "int1";
>  			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
>  			clock-names = "hclk", "cclk";
> -			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
> +			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
>  			status = "disabled";
>  		};
>  
> @@ -952,7 +952,7 @@
>  			interrupt-names = "int0", "int1";
>  			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
>  			clock-names = "hclk", "cclk";
> -			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
> +			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
>  			status = "disabled";
>  		};
>  
> diff --git a/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt b/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt
> index 70e76be2a3..ad2bef8265 100644
> --- a/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt
> +++ b/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt
> @@ -18,8 +18,10 @@ Optional properties:
>  - dmas: DMA specifiers (see: dma/stm32-mdma.txt)
>  - dma-names: Must be "tx", "rx" and "ecc"
>  
> -Optional children nodes:
> -Children nodes represent the available NAND chips.
> +* NAND device bindings:
> +
> +Required properties:
> +- reg: describes the CS lines assigned to the NAND device.
>  
>  Optional properties:
>  - nand-on-flash-bbt: see nand.txt

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
