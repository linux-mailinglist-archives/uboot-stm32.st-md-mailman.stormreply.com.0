Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C366F65
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:59:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE53CD40901
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:59:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BD74C06B9E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:59:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCwnJL016373; Fri, 12 Jul 2019 14:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=X/PM2LeXemDgwgQZjkY77dPFTZ5CUsMucH1sn3mggII=;
 b=WNMoo0eNFP9UXgr4clsq1EpbwLoOQi+eYX3AUFAQwBuWOhDGKL2Pen+GPIWZfHu3QcHa
 jDHl7dxqpwdPlt0StY292THqBsTcdDgX7qKBrbVxepy7d8JUUDfEergB2rsmeIklBG1Z
 Av+sxgd24pCOxHuQB1ziVwl6M2D9oWX30XBpK1Tji/D/J9kW0HTokbbxeBcNjhAs6FHz
 kZPLhxc3nDZ9ZzXmok7bGuZzE2ESTzdfIo9ZLFSNmKi3JgAbS3do+jx0UzM0Ar59Hqcl
 qhNpuwiRQsp6MjVrx0QA4QY+RUapKTZVTenDaDWOXaoeUPdwwGb4qwJZFS+g1cWjzJx5 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjgsaj75b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:59:52 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 736BE38;
 Fri, 12 Jul 2019 12:59:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 604FE2C4C;
 Fri, 12 Jul 2019 12:59:45 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 14:59:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:59:44 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] pmic: stpmic1: add support for SYSRESET_POWER_OFF
Thread-Index: AQHVDuA/8W8L4eyCP063J93lC33SRqbHRVTg
Date: Fri, 12 Jul 2019 12:59:44 +0000
Message-ID: <d1852c30d237474fbb2ef54d2f4cc724@SFHDAG6NODE3.st.com>
References: <1558338427-9230-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558338427-9230-1-git-send-email-patrick.delaunay@st.com>
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
 Jaehoon Chung <jh80.chung@samsung.com>, Christophe
 KERELLO <christophe.kerello@st.com>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] pmic: stpmic1: add support for
	SYSRESET_POWER_OFF
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
> Sent: lundi 20 mai 2019 09:47
> 
> Adds support for SYSRESET_POWER_OFF = PMIC power off used by command
> power off and introduced by commit 751fed426f87 ("sysreset: Add a way to find
> the last reset").
> The driver use SYSRESET_POWER for the PMIC-level power cycle, with restart.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/power/pmic/stpmic1.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
