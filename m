Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 817DA670E5
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:01:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37C37C6A602
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:01:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8480C69071
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:01:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CDvN45025590; Fri, 12 Jul 2019 16:01:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8yootti8uGulwiHYl+wS3TrQQQbB7Z7m4lVN0bBy47Y=;
 b=i9tzJhmWUgvoqIL6W7KJQ+q/fLohgC6OfOZ+LIn/niVfExjAAT7yseP/KKHoirrcaOls
 6VPBiu6LSaNkym6Oow//q5Dt108sobAPLuOjAGWJb3y1Tg6ghh4inmC+/QeufA8jje2d
 npxTQuj0t1ErnSnOWy0Ak/Wq/QYqHcJ2RWYZM/RAUmWT72Mud2PPBFokry40koPI1Lit
 gkrQNx5TKqiS2OgTGdMHrO0ntaYROlaphwve/9HI+UVD0NSbSNvMvx7AdNaGTSjHpEnc
 8QQRZgFYG6GW0dl8TYr/nSgQmaNv70mfpTCuamc8XPGcCVc3mTqjBAUB/whcAraa/9kg IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjgsajhdu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:01:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E16B4D;
 Fri, 12 Jul 2019 14:01:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DF3B4E56;
 Fri, 12 Jul 2019 14:01:23 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 16:01:22 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:01:22 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 16/20] mtd: rawnand: stm32_fmc2: avoid warnings when
 building with W=1 option
Thread-Index: AQHVKDUO0GAGa3pufUWyk/LYk9q2Y6bHI70Q
Date: Fri, 12 Jul 2019 14:01:22 +0000
Message-ID: <c038e84f40994ec79ae4965cc267462e@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-16-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-16-git-send-email-patrick.delaunay@st.com>
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
 Christophe KERELLO <christophe.kerello@st.com>
Subject: Re: [Uboot-stm32] [PATCH 16/20] mtd: rawnand: stm32_fmc2: avoid
 warnings when building with W=1 option
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
> Sent: vendredi 21 juin 2019 15:27
> 
> This patch solves warnings detected by setting W=1 when building.
> 
> Warnings type detected:
>  - [-Wsign-compare]
>  - [-Wtype-limits]
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 93 ++++++++++++----------------------
>  1 file changed, 31 insertions(+), 62 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
