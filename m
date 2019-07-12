Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E742A670DA
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:01:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2465D40C0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:01:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3BD5D40C11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:01:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CDvBHP013929; Fri, 12 Jul 2019 16:01:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/9shrGD/MpnskI+6mKSDhfJuS22CuIJSdG+j0Ga5sZ8=;
 b=qR2naF/XLIaA1EmHbTRZukmuAuJEuCb3NpXpff7cTh2JO4nEucc+NBF3J3IIRVL6lOtu
 9QD0pqT1OQfFbXO2ZyxdfRByExN9ALAHWEmdQICDutVDmx9EcsdhyDP28JcX+Ag6Glrz
 gOAzIecQT3GHeHVKoV0/4PZQ+Ph5jkY5A22GHfQkoy1B8OxY7Pzv7NPkggL5YxqU1wWe
 V8vk5CrVESalDcGC+u+cE/igrHl+V7axMHGr6C0c0OyRV4vVeJsYmIIj9Nskwx2Lf9jE
 r22qP8PISIiVE9UZZVpEg5cXLCVzdEUZZp4PSS+Hd0nVGr6+fl9PRloUjwlI2sCLP8DV IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjjhjadjr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:01:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8480648;
 Fri, 12 Jul 2019 14:01:21 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74D464E4E;
 Fri, 12 Jul 2019 14:01:21 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 16:01:20 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:01:20 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 12/20] misc: stm32_fuse: Fix warnings when compiling with
 W=1
Thread-Index: AQHVKDUKh3YDcG+6rUinFCW/Hv12u6bHI2qQ
Date: Fri, 12 Jul 2019 14:01:20 +0000
Message-ID: <6c091403d5f840558df9840ae9e18f73@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-12-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-12-git-send-email-patrick.delaunay@st.com>
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
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 12/20] misc: stm32_fuse: Fix warnings when
 compiling with W=1
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
> This patch solves the following warnings:
> 
> warning: no previous prototype for 'fuse_read' [-Wmissing-prototypes]  int
> fuse_read(u32 bank, u32 word, u32 *val)
>      ^~~~~~~~~
>   CC      cmd/sf.o
> warning: no previous prototype for 'fuse_prog' [-Wmissing-prototypes]  int
> fuse_prog(u32 bank, u32 word, u32 val)
>      ^~~~~~~~~
> warning: no previous prototype for 'fuse_sense' [-Wmissing-prototypes]  int
> fuse_sense(u32 bank, u32 word, u32 *val)
>      ^~~~~~~~~~
> warning: no previous prototype for 'fuse_override' [-Wmissing-prototypes]  int
> fuse_override(u32 bank, u32 word, u32 val)
>      ^~~~~~~~~~~~~
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/misc/stm32mp_fuse.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
