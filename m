Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E0200A2
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 09:49:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32C1CC35E03
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 07:49:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98960C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2019 07:49:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G7mr7R026089; Thu, 16 May 2019 09:49:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/xyyWWriyqWuhOdsWBmZQaK80zKxP/FzVad1t7MUeEE=;
 b=M39XSF4uFTcpRK8TYiV8CmT6oUAwUXf0zh2wxLSj9jbi/ZxrD2NBsf8KgHSDE7KO1Ktd
 fX0nkmiOr2hv5hediTLvh+jGPLuEhpfS3RH0i4453jPMj0i0bnGze2kkNISAPsZTd37o
 SO2qmxP5LpKcGo3G+sFFJ943jik8IvGifZ9KVqhiM5pOQcW9TqrcBsq/hR2Kq4z9jHYm
 DDJRrjJBoYZM4+yWGIyOfKNHtiGgg0cvbYIhAU56HQzwJyPK+QcVXzGxqSmn+X2HaTIV
 RW1fQ9T0D0Cr122AREyFX5U5bEhOg0uijPzZyuI7SJuAvxFtX265t6O6AcTfqqD21jpU IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sek5aqt2d-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 16 May 2019 09:49:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48F373A;
 Thu, 16 May 2019 07:49:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12711148B;
 Thu, 16 May 2019 07:49:32 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 May
 2019 09:49:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 16 May 2019 09:49:31 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Thread-Topic: [PATCH 2/4] MAINTAINERS: Add stm32 mailbox IPPC driver
Thread-Index: AQHVCjZT1AjMM0bhs0i9p7z0ZBBTU6ZtQdaA
Date: Thu, 16 May 2019 07:49:31 +0000
Message-ID: <cc2892d0-98ef-84a5-4b99-0426f0b16975@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
 <1557825637-25153-3-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-3-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <CB57F221ABCA5B4A92F0E1DF8603F1F6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_06:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/4] MAINTAINERS: Add stm32 mailbox IPPC
	driver
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



On 5/14/19 11:20 AM, Fabien Dessenne wrote:
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 33fd465..5523c4a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -301,6 +301,7 @@ S:	Maintained
>  F:	arch/arm/mach-stm32mp/
>  F:	drivers/clk/clk_stm32mp1.c
>  F:	drivers/i2c/stm32f7_i2c.c
> +F:	drivers/mailbox/stm32-ipcc.c
>  F:	drivers/misc/stm32mp_fuse.c
>  F:	drivers/mmc/stm32_sdmmc2.c
>  F:	drivers/phy/phy-stm32-usbphyc.c
> 

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
