Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2204B910
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 14:48:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B780C55187
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 12:48:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9560C55187
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 12:48:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JCkTef028795; Wed, 19 Jun 2019 14:48:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GkyffGQHLPyzTILh9G15te4tqED2yJQrJYo46zwBD/k=;
 b=ZoCGm9N1vtpyqXG5RZWBXJQeO2btWLMVGfalslbHmh63egjJOpUEH+r2FoQK/jHwjcdr
 KmhUnFKXwG4ktJ7bauOodtFk2QREiI3nXH+WKQNpg27fXHriC7NBbuA4ehKdjpMjtNoM
 sM1yLI4m81QcyMWy14VzuwPNvfjqRIj4qFzYu+FcnbKKqeX6soIKhhQ8hnbuvL1Z3+L1
 1Rv2BWMkmh2kSHpDODR56nIlNhNgcOxC6S6n4P6QyPi1VyfNHYG+1XI7+iwkIEO+BzVi
 QmtFIc5ssoZ6WrOyuYmlvudZUh/OUWeGWyM/0Uv6i9gmQ7xUTMgnvGmC1LFP5HWsoPOF xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781uv0vw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 14:48:01 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00F113A;
 Wed, 19 Jun 2019 12:47:58 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag7node2.st.com [10.75.127.20])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69F222812;
 Wed, 19 Jun 2019 12:47:58 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG7NODE2.st.com
 (10.75.127.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 14:47:57 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 14:47:58 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Albert Aribaud
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
Thread-Topic: [PATCH 0/4] mailbox: introduce stm32-ipcc driver for stm32mp157
Thread-Index: AQHVCjZUUIO2ObciQ0ul6YaVLlFeDaajBHyA
Date: Wed, 19 Jun 2019 12:47:58 +0000
Message-ID: <3f7423e7-faf8-1307-68e2-79c94722065c@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <7A0834D455C94646845AE545D900170D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/4] mailbox: introduce stm32-ipcc driver
	for stm32mp157
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


Are there any further comments?


BR

Fabien


On 14/05/2019 11:20 AM, Fabien Dessenne wrote:
> This patchset adds the mailbox ipcc driver for the stm32mp1 SOC
> and enables it for the stm32mp157 boards.
>
> Fabien Dessenne (4):
>    mailbox: introduce stm32-ipcc driver
>    MAINTAINERS: Add stm32 mailbox IPPC driver
>    configs: stm32mp15: enable IPCC mailbox
>    ARM: dts: stm32: Add ipcc mailbox support on stm32mp1
>
>   MAINTAINERS                         |   1 +
>   arch/arm/dts/stm32mp157a-dk1.dts    |   4 +
>   arch/arm/dts/stm32mp157c-ed1.dts    |   4 +
>   arch/arm/dts/stm32mp157c.dtsi       |  13 +++
>   configs/stm32mp15_basic_defconfig   |   2 +
>   configs/stm32mp15_trusted_defconfig |   2 +
>   drivers/mailbox/Kconfig             |   7 ++
>   drivers/mailbox/Makefile            |   1 +
>   drivers/mailbox/stm32-ipcc.c        | 167 ++++++++++++++++++++++++++++++++++++
>   9 files changed, 201 insertions(+)
>   create mode 100644 drivers/mailbox/stm32-ipcc.c
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
