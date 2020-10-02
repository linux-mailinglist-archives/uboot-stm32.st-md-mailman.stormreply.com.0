Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A8280FB7
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:20:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00FDEC424AF;
	Fri,  2 Oct 2020 09:20:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5001AC3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:20:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929743U015382; Fri, 2 Oct 2020 11:20:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=X1rvIqYwUz31uu+uXAHIbUbrHkw8AURb0DMVq1xUjy4=;
 b=0HfiB3EqNp6cugj0olKtFgoyl2Woz/q+4iUMEjCOTX0u1IlrWME/jbz6rKMKxv3xsXcL
 QRPdnoBg9X6D5CScjZ8RvTUexIkagNdgT320llAfdfyTNptUHVnJVfgbNOdAxG3OVzCI
 khIYEKI8nDvjfwF+2KixwwfpTI+1eLpPtQupjKaZSulEfQkt1o9UBlnwfwZChi8qMtTr
 3U/G0oi/XHI6z76sPylow9fbJmRl17A/Yga+z/KtsG7oVv/dI+Eq3H2czWJflWVnEsdT
 p93rh0WgOmv7McaK/3ck5YcxRrbbqO+/uj0lzrBzTqVL5K47exvnqs0CpXBq6q6YVyC4 CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf2b2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:20:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C79B810002A;
 Fri,  2 Oct 2020 11:20:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA0952B0873;
 Fri,  2 Oct 2020 11:20:41 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:20:41 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:20:41 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "peng.fan@nxp.com"
 <peng.fan@nxp.com>
Thread-Topic: [PATCH v2 2/2] mmc: stm32_sdmmc2: Use mmc_of_parse() to read
 host capabilities
Thread-Index: AQHWi5mtcGbc77IZCUO45VDKXHcwnqmEIudQ
Date: Fri, 2 Oct 2020 09:20:41 +0000
Message-ID: <11f07b6448814c54924026c352f6ebf4@SFHDAG6NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-2-mr.nuke.me@gmail.com>
In-Reply-To: <20200915195147.2659607-2-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
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

Hi,

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

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
