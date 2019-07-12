Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4866F24
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:49:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4095D406BB
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:49:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7337DD406BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:49:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CClD3O032236; Fri, 12 Jul 2019 14:48:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MiZTAk3DXUXXNphD9edZA4cFOPP2+s/EDLrJZd1F0R8=;
 b=DkXVPX8R7WNI0YRZ+1926tT9aieLF8TFSOzvyiubl316sHaPkTw8ThjkkSArI0vXBUQj
 5nP4kgXhPJvO2uI575SwYE29WzJae1qTva/krDG4sCJsP2NOzpUHSNgXefynsErHMlyi
 0pQGA36YBI6rFywTuTFxNazDJ8kYkPj2qIejuLVpQuQ9Uvs5kWTPnxvByxCxIxiICPn7
 5K462KwnVJR5sSiQoE2cyYysCt/Rdea7uaPuaxVv+qWPf5/TA/YhPec+CXPwyhc37Nx4
 W9ss/SnPvDd9KyoU9+pW+1ql6R0tgATX4LCL7SFQJMedZzEFtm9OSueQjvBgHV3QHGr1 GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh51rdct-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:48:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7128E3F;
 Fri, 12 Jul 2019 12:48:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag7node3.st.com [10.75.127.21])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A1012BFC;
 Fri, 12 Jul 2019 12:48:54 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG7NODE3.st.com
 (10.75.127.21) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:48:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:48:53 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Albert Aribaud
 <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Thread-Topic: [PATCH 1/4] mailbox: introduce stm32-ipcc driver
Thread-Index: AQHVCjZT9v0DZiVDWUCeavu7CRrNtKbHS6bA
Date: Fri, 12 Jul 2019 12:48:53 +0000
Message-ID: <1a21916e44f4488ebd04bddc125af8eb@SFHDAG6NODE3.st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
 <1557825637-25153-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-2-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/4] mailbox: introduce stm32-ipcc driver
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

Hi,

> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: mardi 14 mai 2019 11:21
> 
> On STM32 family, the IPCC peripheral allows the communication between 2
> processors offering doorbells mechanism.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/mailbox/Kconfig      |   7 ++
>  drivers/mailbox/Makefile     |   1 +
>  drivers/mailbox/stm32-ipcc.c | 167
> +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 175 insertions(+)
>  create mode 100644 drivers/mailbox/stm32-ipcc.c
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
