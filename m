Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6DD7F590
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:55:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C59BCC35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 10:55:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF6D3C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 10:55:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72Ar1Ea011904; Fri, 2 Aug 2019 12:55:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FAXIUIwbyaqjzaW890gVk+Bw6f3lzw0F9THqyzNzT3M=;
 b=wk0w7x6At2c8mINWKXVwla8IjmDYIaDL7A58EZ/gbACH246LkPxRe+IL6KpeNYEu7BQe
 XlYSo7gxSaN/uMIQdJgXyFObB/KtYwtVJLiNn+Bs+msw/1r+ciKpHYzidRN0g+GeDTOG
 omgpa7J10RDFu0b5lHwgsSdFe67eS+cI8t+lgnld1z1LtBsCGUOQogPV8XXDzC9d5H95
 15a1Jorbq/MLrSekZsG9/RGFHJinp4cIT7/vTQKTBJQwctUR3EncEEqhYgz75nVipCin
 Quhmt8LdKlcrqLyQk47QlC+2dLPAjw0KH1oA21zkRnga4Iro2PG7zYPpUy0gJcXn6Img tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0brafr1n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 12:55:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A612A31;
 Fri,  2 Aug 2019 10:55:21 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97171207409;
 Fri,  2 Aug 2019 12:55:21 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 2 Aug
 2019 12:55:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Aug 2019 12:55:21 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/5] bsec: update after MISC u-class update
Thread-Index: AQHVPhXkuY1FZZqe/UOtye03U3kco6bnxK3w
Date: Fri, 2 Aug 2019 10:55:20 +0000
Message-ID: <6b62c435d30c4dffa6cbf2b8719aae09@SFHDAG6NODE3.st.com>
References: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
 <1563529171-16796-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1563529171-16796-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] bsec: update after MISC u-class update
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
> Sent: vendredi 19 juillet 2019 11:39
> Subject: [PATCH 1/5] bsec: update after MISC u-class update
> Importance: High
> 
> Since the commit 8729b1ae2cbd ("misc: Update read() and
> write() methods to return bytes xfered"); The misc bsec driver need to be adapted
> to reflect the number of transferred bytes.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c | 31 ++++++++++++++++---------------
> drivers/misc/stm32mp_fuse.c  | 30 +++++++++++++++++-------------
>  2 files changed, 33 insertions(+), 28 deletions(-)

For information, this patch need rework after commit dae0bd28c1638ea751021045bd1453b2ba3f3245
"stm32mp1: bsec: Fix warnings when compiling with W=1"

This commit is integrated in v2019.10-rc1 and I will rebase the patchset and sent a V2.

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
