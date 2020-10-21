Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 050A9294A23
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 11:06:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8E9AC3FAD5;
	Wed, 21 Oct 2020 09:06:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3826C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 09:06:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L8vplx006286; Wed, 21 Oct 2020 11:06:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ooIRhr6ttuIOqcNosFt+3UYd8jf2eX8zZCNHHmLRA/o=;
 b=BT5H0GluSzXQxAEuXkj+oj19MAwsskJBgc6dxT/zAMFCLUNkbv6HcJSMB0tnY4gTX3Y4
 J+wRApLOI4hh1crdD2wdHg61NQkeNSv8dsi/nwcHsUzycJC6InZamEnetr0q/bU5DLzI
 voxsJi0p5p6SjXSFtAaraI/ijESm6s7nilm59yCOoBZDR6fb58n5Hgl1pjZNYYBn+mcl
 7LxwwM7pqkymiSSwsxbRDfnnNYjpHQ//FIiIprVl5DdQeiuo/j7kF3AFCcqThx7Zd14Q
 B+vsMhfkYFSROLDfh91U7yhf3GiHYgXXStcr/sWx/YF2asqtfLwu+eTvtpRrImo7/+gZ DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qgg9br7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 11:06:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A22F210002A;
 Wed, 21 Oct 2020 11:06:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93B322BF53E;
 Wed, 21 Oct 2020 11:06:41 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 11:06:41 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 11:06:41 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "peng.fan@nxp.com"
 <peng.fan@nxp.com>
Thread-Topic: [PATCH v2 2/2] mmc: stm32_sdmmc2: Use mmc_of_parse() to read
 host capabilities
Thread-Index: AQHWi5mtcGbc77IZCUO45VDKXHcwnqmh+5xA
Date: Wed, 21 Oct 2020 09:06:41 +0000
Message-ID: <95e825dd0d234f3da8a0ebfdef086d63@SFHDAG2NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-2-mr.nuke.me@gmail.com>
In-Reply-To: <20200915195147.2659607-2-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] mmc: stm32_sdmmc2: Use
 mmc_of_parse() to read host capabilities
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

Hi Alexandru,

> From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Sent: mardi 15 septembre 2020 21:52
> 
> mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of struct
> mmc_config from devicetree.
> The same logic is duplicated in stm32_sdmmc2_probe(). Use mmc_of_parse(),
> which is more generic.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
> Changes from v1:
>  - Check the return value of mmc_of_parse().
>  - The call to mmc_of_parse() is moved further up. This means we can just
>    'return err' on error instead of exiting via goto.
> 
>  drivers/mmc/stm32_sdmmc2.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
