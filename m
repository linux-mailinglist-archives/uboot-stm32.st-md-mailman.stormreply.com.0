Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FAB1907E8
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:42:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3F92C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:42:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38E63C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:42:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8bmoZ026593; Tue, 24 Mar 2020 09:42:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=R3NciSA+fBhm86cn1dOQ1cUlBi0IDKUmYJBiaKdbijU=;
 b=fC4tL+Ef5C+gFd+Blwj3OoRvFBUI28eCGu1V3inb/dds8q8x5lypkqDkOGmV69l0HMFM
 oyRsynqMsu2lX9f1DAIUTzNHoe355+3eQCwiyy5rEaScgCV9dZR+9fmD4yeazPgn303R
 z91TvB8XlN7vorD+DhOrJ6sEkGWWCNqd4Nqcfs9DfPJv2lg071UX3Vk6RXp8RkhBOrhI
 i33flI2IVPdmoU1eRrco+8JRY0soU/q1vSpy0OdNVjx/ECo8VKntwTeZKIPCAPXpjNOi
 pOfv3Op/TrsMpEoj1KyzbUleAEMmHMdn82s8mEFRPo61zxAoamaFXl2K+ld5WnCyYz+S ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ywapnx5bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:42:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3227C100040;
 Tue, 24 Mar 2020 09:42:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2921121F68F;
 Tue, 24 Mar 2020 09:42:02 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:42:01 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:42:01 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: psci: set cntfrq register of cpu on
Thread-Index: AQHV8H0fy+ltsLkoNE+jf8WF6fIt/qhXjwfg
Date: Tue, 24 Mar 2020 08:42:01 +0000
Message-ID: <df71b0288ce0434dad3bc7ca3551b5c6@SFHDAG6NODE3.st.com>
References: <20200302102702.6917-1-patrick.delaunay@st.com>
In-Reply-To: <20200302102702.6917-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: psci: set cntfrq register of cpu
	on
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
> Sent: lundi 2 mars 2020 11:27
> 
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This path allows to set the cntfrq register of targeted cpu.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
