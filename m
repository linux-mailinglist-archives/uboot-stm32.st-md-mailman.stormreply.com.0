Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C54294926
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 09:59:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC81EC3FAE0;
	Wed, 21 Oct 2020 07:59:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5E4CC3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 07:59:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L7rBBc028229; Wed, 21 Oct 2020 09:59:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=L9jycU3weft/iArDerd0lGhFcKjDommaf9PJwMd5Dwo=;
 b=Z1yQ11EisPqMrXJ6+J0X1GZV8tvOfp5aoQIhTINpj4LzIfnauKru0BaeDEPU3c664ltq
 V4BN39o21q9qvbQ7SOpRaiQmm/N4MvHsDhiS/S8yRazcsz4WkF0E0Rmhoxuxgw35rBa6
 bhdvMkD1NDDv8e9GPikmC7GmXUTGzlL/Zj+WDMXG63L9X/prR8ZCrbiuhpVRlNDJynp5
 +m4L19TOXsKWeikwCJH1NRq8K0NiOECwaHF0mnnTxkhON/9GyEAIGWVvAkQLmjy87dqV
 q4qF0lj3UGTdBhAvcWh49VBjD7PevdUbhR7zPCTi9GkAPx+pBAlA3unrIORHtQAa2Nu6 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8hbvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 09:59:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3435A100034;
 Wed, 21 Oct 2020 09:59:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28E552B6316;
 Wed, 21 Oct 2020 09:59:29 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 09:59:28 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 09:59:28 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "peng.fan@nxp.com"
 <peng.fan@nxp.com>
Thread-Topic: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with
 "cap-mmc-highspeed"
Thread-Index: AQHWi5msGhDIPL5WykOA1I3zu06JJ6mh6MJA
Date: Wed, 21 Oct 2020 07:59:28 +0000
Message-ID: <7c65f2a594e249c28ebb65a3e9bd402d@SFHDAG2NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-1-mr.nuke.me@gmail.com>
In-Reply-To: <20200915195147.2659607-1-mr.nuke.me@gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz
 support with "cap-mmc-highspeed"
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
> To: uboot-stm32@st-md-mailman.stormreply.com; peng.fan@nxp.com
> Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>; Patrick DELAUNAY
> <patrick.delaunay@st.com>; Patrice CHOTARD <patrice.chotard@st.com>; u-
> boot@lists.denx.de
> Subject: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with "cap-
> mmc-highspeed"
> Importance: High
> 
> "cap-mmc-highspeed" enables support for 26 MHz MMC, but there is no additional
> flag to enable 52 MHz MMC. In Linux. "cap-mmc-highspeed"
> is used for MMC HS at both 26MHz and 52MHz.
> 
> Use the same approach and enable MMC_CAP(MMC_HS_52) host capability
> when "cap-mmc-highspeed" is found in the devicetree. In the event an MMC card
> doesn't support 52 MHz, it will be clocked at a speed based on its EXT CSD, even
> on 52 MHz host controllers
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/mmc/mmc-uclass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
