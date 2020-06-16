Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 981491FAAC5
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 10:09:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F0BFC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 08:09:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47954C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 08:09:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G84Nea011715; Tue, 16 Jun 2020 10:09:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Y3G9pPgyLDucNofss09P0oAeW+Kt8X16beGXsk11E4k=;
 b=gNJcG087hCaUvRT0qlA9EXvBi+W8agBptZR3vQvMpkkCNWzOrt5G5FbHncvWhpR6UiiO
 4L98jbbipwlkZ8lpoqYeOAJaN6GI2+ASTZxvKWkQMLyXK1eYYHScX4nFwxU9AVniw/so
 ptrLHr9bycjWFvf4V+ukedrPR518JRICORqqeJ1an+LhtRcns6AV9s8fNcLbbesv8nqV
 AhyAbq11VQ74QQZG0pW5HQ1RGt7Qm8xs9PLVk9Ql8SxFnHcwp/Q5MA+BQEQdX4gD/LQC
 r2LXz2qbyVpLn7N2OYXzNevIqm3L8tg+A1fdZDp23G+4P2aOQjXLLFxHnvbv7iR7Qm/W Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx963am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 10:09:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E108100034;
 Tue, 16 Jun 2020 10:09:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A0022B1860;
 Tue, 16 Jun 2020 10:09:39 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun
 2020 10:09:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 16 Jun 2020 10:09:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/2] dts: ARM: stm32mp15: add OP-TEE node
 in u-boot DTSI
Thread-Index: AQHWQ7V7X86ibcvIRUCZ1xHZxVV3vg==
Date: Tue, 16 Jun 2020 08:09:39 +0000
Message-ID: <2d24e895-09dd-162f-c1af-5bd0ce750a3f@st.com>
References: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
 <20200605092427.2.I0b49a502a439eb6530b486f5e3ab4923195bff8e@changeid>
In-Reply-To: <20200605092427.2.I0b49a502a439eb6530b486f5e3ab4923195bff8e@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <1CF9467D72C3E34B8B10F9E103F57328@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Tom Rini <trini@konsulko.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] dts: ARM: stm32mp15: add OP-TEE node
 in u-boot DTSI
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

Hi

On 6/5/20 9:24 AM, Patrick Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@linaro.org>
>
> Add OP-TEE firmware node in stm32mp15 U-Boot DTSI. This node is
> needed since commit [1] that changed U-Boot/stm32mp15 to detect
> OP-TEE availability by probing the resource instead of relying on
> U-Boot configuration. The software sequence implemented by [1] is
> fine but U-Boot DTS/DTSI files were not updated accordingly since,
> hence OP-TEE presence is never detected by U-Boot, preventing Linux
> kernel from using OP-TEE resources.
>
> For consistency and to synchronize stm32mp15 DTSI files (excluding
> U-Boot specific DTSI files) with the Linux kernel ones, this change
> also moves the OP-TEE reserved memory nodes from board generic DTSI
> files to U-Boot specific board DTSI files.
>
> Link: [1] commit 43df0a159df6 ("stm32mp1: dynamically detect op-tee presence")
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 15 +++++++++++++++
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 14 ++++++++++++++
>  arch/arm/dts/stm32mp157c-ed1.dts         |  5 -----
>  arch/arm/dts/stm32mp15xx-dkx.dtsi        |  5 -----
>  4 files changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index c52abeb1e7..3fedb6f1e1 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -20,6 +20,21 @@
>  		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
>  	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	reserved-memory {
> +		optee@de000000 {
> +			reg = <0xde000000 0x02000000>;
> +			no-map;
> +		};
> +	};
> +
>  	led {
>  		red {
>  			label = "error";
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index 84af7fa47b..a07c585415 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -21,6 +21,20 @@
>  		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
>  	};
>  
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	reserved-memory {
> +		optee@fe000000 {
> +			reg = <0xfe000000 0x02000000>;
> +			no-map;
> +		};
> +	};
> +
>  	led {
>  		red {
>  			label = "error";
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index 4fb71100f5..186dc46754 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -70,11 +70,6 @@
>  			reg = <0xe8000000 0x8000000>;
>  			no-map;
>  		};
> -
> -		optee@fe000000 {
> -			reg = <0xfe000000 0x02000000>;
> -			no-map;
> -		};
>  	};
>  
>  	aliases {
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 812e370ee4..7589c6f9dc 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -58,11 +58,6 @@
>  			reg = <0xd4000000 0x4000000>;
>  			no-map;
>  		};
> -
> -		optee@de000000 {
> -			reg = <0xde000000 0x02000000>;
> -			no-map;
> -		};
>  	};
>  
>  	led {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
