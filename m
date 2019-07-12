Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007E66F2B
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:50:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E5C8D406C9
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:50:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D3E8D406C6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:50:11 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCkdPZ008025; Fri, 12 Jul 2019 14:49:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=g75Hvp9S/U4h17VOB4NMIBZ3LwmSz8VruVsbbGj6/vM=;
 b=ik3v9PqAQH8qNvulLdqCTxqIARDPC5FR2YCEUJ/JoWj7PhN+M2cpZs4jMQnr5fLBbtza
 QUgWcPSknGamb8lVA+Jg5VHIspsuXZXgc/bLzExNGogafYoBRJryobyYoUEghWSeivX8
 xYhoh8loyI3ep06gSnN9DLaTYeML5VSCmHiKprD7lBnQcBNKg7z1IQaSuXzFfE3MO6iH
 zDRzJxhqyQeRWRUXiCN516qh3ozGtmzFnAIV/Q0d0OxZojS2E3sQCvmaHYbghA6dGjAk
 L3E2L5JGApCdFBnWpbHDjCJr9xpNte6IROwwmbUvuScmMvJdoJzHwqIIDZ2xggympk+w sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tk2jc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:49:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16FB931;
 Fri, 12 Jul 2019 12:49:51 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3D452C1B;
 Fri, 12 Jul 2019 12:49:50 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:49:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:49:50 +0200
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
Thread-Topic: [PATCH 3/4] configs: stm32mp15: enable IPCC mailbox
Thread-Index: AQHVCjZVc1YSRHtNq0CUqaYMqdWmM6bHTAkQ
Date: Fri, 12 Jul 2019 12:49:50 +0000
Message-ID: <afc5130e5bbe4834949b81dbf18411d9@SFHDAG6NODE3.st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
 <1557825637-25153-4-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-4-git-send-email-fabien.dessenne@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 3/4] configs: stm32mp15: enable IPCC
	mailbox
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
> Activate the ipcc mailbox for stm32mp15 configs.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  configs/stm32mp15_basic_defconfig   | 2 ++
>  configs/stm32mp15_trusted_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
