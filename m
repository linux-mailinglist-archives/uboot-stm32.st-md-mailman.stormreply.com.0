Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC691B770B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 15:35:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F04B8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 13:35:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36475C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:35:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ODTcT4016133; Fri, 24 Apr 2020 15:35:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=r5gvQs9uoTp3GfJp0GxdsfXzCjs3b2UzkdCA+GKWHP4=;
 b=xLznVMMRfelFwDnltJkmqrJg0/v9exmHxOjZqc6FZn2mTeaDplziVmicpl5LzPqYB30S
 Ju1g+c30bfed8eNdxX6i5akgW2GA66XLUm4Y0KIUh2t+A+hApUSb0TJ2NcSD5jrD53sa
 E0mv2npCwqC8PRcQnfbZFk/qFsNRS5tT4rjpJ+vNm/2WXwTNkCjsVvv8/ZfbzvGfFlTi
 09MfCQgHt8TMULa0SS6FU2BIAQJ7bBik7qq+hLzcQTHVXZE5sJl8wbFUmnPEBuMV019g
 J79jFiIp1meFpmLC5h1bwsjvf5ecWA0SHucgdtAtuzmOTGA3ArzGjTkndfHw5Sy7y3pm EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawuaqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 15:35:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2DFA10002A;
 Fri, 24 Apr 2020 15:35:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E840E2BF9DE;
 Fri, 24 Apr 2020 15:35:44 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 15:35:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Apr 2020 15:35:44 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2] env: add prototypes for weak function
Thread-Index: AQHV1bOOi8ORzjcltU+eY2DqJFckhaiIzpsg
Date: Fri, 24 Apr 2020 13:35:44 +0000
Message-ID: <c56a6f45ce004c51a5fab49147a3c949@SFHDAG6NODE3.st.com>
References: <20200128081840.24926-1-patrick.delaunay@st.com>
In-Reply-To: <20200128081840.24926-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_06:2020-04-24,
 2020-04-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] env: add prototypes for weak function
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
> Sent: mardi 28 janvier 2020 09:19
> 
> This patch adds prototypes for several weak functions:
> - env_ext4_get_intf
> - env_ext4_get_dev_part
> - env_get_location
> 
> It solves the following warnings when compiling with W=1 on stm32mp1 board:
> 
> board/st/stm32mp1/stm32mp1.c:849:19: warning: no previous prototype for
> 'env_get_location' [-Wmissing-prototypes]  enum env_location
> env_get_location(enum env_operation op, int prio)
>                    ^~~~~~~~~~~~~~~~
> board/st/stm32mp1/stm32mp1.c:876:13: warning: no previous prototype for
> 'env_ext4_get_intf' [-Wmissing-prototypes]  const char *env_ext4_get_intf(void)
>              ^~~~~~~~~~~~~~~~~
> board/st/stm32mp1/stm32mp1.c:889:13: warning: no previous prototype for
> 'env_ext4_get_dev_part' [-Wmissing-prototypes]  const char
> *env_ext4_get_dev_part(void)
>              ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2:
> - clarify the comment on the added prototype
> 
>  include/env_internal.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Any comments on this patch ?

Regards,

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
