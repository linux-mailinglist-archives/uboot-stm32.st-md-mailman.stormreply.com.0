Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4815D5D2
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 11:32:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B927C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 10:32:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD237C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 10:32:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EAN29s023645; Fri, 14 Feb 2020 11:32:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SmclqnuuleRcN1oPvuXe6KSFYeE1goGSiAgFvWxuKDI=;
 b=nu3IakV1k7qPoPJJpJd5VXsDb8vLQxXBfL5TEm3r6GmUy7CSGTrEIU5gdrxLZYPKQwnK
 X58hQDMYt92jm6AqCAlYkxrwj6GL6PSHGY2Yfn4tWfIAAFpTLeVqQ/hXbbe5acAqjRUd
 Co1Aw0keTiC9InHUPo4rPVf88ZXDYqnle6fFEd4EOHcc2RheEAEGOlkmq6iNf7GnO81i
 zEVcRKerP5uYSmY0JChS2Nk5K8CblmlsHnPiAE6GYc71mD2m3/ONcklp7oYFnxEmJ2x/
 CAww+FK0c1bJUnxMCIFfv5zkOvT4yhRIrrD6/eYIWpaqgrETfsWySftCgS4DUHZXX3Fi 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhu3xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 11:32:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38CC910002A;
 Fri, 14 Feb 2020 11:32:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 322932AC885;
 Fri, 14 Feb 2020 11:32:35 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 11:32:34 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 11:32:34 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] tools: mkimage: fix STM32 image format for big endian
 hosts
Thread-Index: AQHV1ekiWkDGVW1ZnU6bL504Q64WB6gamDFg
Date: Fri, 14 Feb 2020 10:32:34 +0000
Message-ID: <1513066c89f943afb6f17f65405e74b8@SFHDAG6NODE3.st.com>
References: <20200128144214.23838-1-patrick.delaunay@st.com>
In-Reply-To: <20200128144214.23838-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: Antonio BORNEO <antonio.borneo@st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] tools: mkimage: fix STM32 image format
 for big endian hosts
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
> Sent: mardi 28 janvier 2020 15:42
> 
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Two header fields are not properly converted to little endian before assignment,
> resulting in incorrect header while executing mkimage on big endian hosts.
> 
> Convert the value of the header fields image_checksum and edcsa_algorithm to
> little endian before the assignment.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
