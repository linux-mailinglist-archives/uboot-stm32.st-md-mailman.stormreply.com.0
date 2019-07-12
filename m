Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FD66C56
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:16:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73DFAD3FD38
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:16:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 247FED3FD37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:16:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CC77R9011065; Fri, 12 Jul 2019 14:16:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=av9sIz8Ko71mF51VjQ0cQiPlxUIVv3VesFrQgBu9VAE=;
 b=0+IvcNHafyA0Zf99KWNUM0NrvjeJrvexXOf4DIEqSC+cfu/zJuIjQzp52YWcHGAhSxq5
 s4vYwuPgEaluKgtLGIlVL6OvbOK3fUTQDyuk5M3l0FMQQ/GIyk+B4srdjCiPvn5Ro5wG
 JLxtepIiBTW5W3JzL89Tlj1fDzxfZkaQOtuQuYdSbKL1nf6Rte6ftHx4v07+UqkmA+0u
 KHrKooITZkjR5YeACUeop1Dpp2+3VygnFN88/hvQVqrM8+SqlIaCTRyp4GLDbjAmOHqx
 ohvkCfUHL39cf+N3VdxmGyLgrLYUIUuzz885LzaZyRJGTdHKB+cCIA2gTA/Q2Xc2eE50 Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjgsaj08q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:16:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 717AA3A;
 Fri, 12 Jul 2019 12:16:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 423962B8C;
 Fri, 12 Jul 2019 12:16:30 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:16:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:16:29 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 07/16] stm32mp1: update package information in device
 tree
Thread-Index: AQHVM0Uxr7qJXC/6iEqef3Kh5kVCkabG8E3g
Date: Fri, 12 Jul 2019 12:16:29 +0000
Message-ID: <0abfe192dcd7453298f9af13fc5442ef@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-8-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-8-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 07/16] stm32mp1: update package
 information in device tree
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

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 5 juillet 2019 17:20
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/Kconfig               |  1 +
>  arch/arm/mach-stm32mp/Makefile |  1 +
>  arch/arm/mach-stm32mp/fdt.c    | 45
> ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 arch/arm/mach-stm32mp/fdt.c
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
