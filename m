Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04183190852
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:53:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAC2FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:53:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F14C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:53:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8loxv006493; Tue, 24 Mar 2020 09:53:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GMJjiim1JQ14S4lhbMoy7B6yv+I9c6NK36rd6ejcvxk=;
 b=W4Szid8SD6NjfOL7GTpkt21D91tyhZ8vSqyCHeTXsLoRYC+R/wtd6mrwiRkGkTIoHutn
 HINxhz4RhiBdFThWi6FBjQrN/xE8kJqRpTAdzdX2YvO9aNSR/Nvm8T6ynCHPCIGsUJYc
 sE5sy8Gubl+bw0tTA6imlV1vV4msg+YG7z5QaSGAj0zxFiFoA8nPCMf1r0sCqL50MvJp
 91p+RXTUmDyhb3K7obvTlQ0zX4AOZsz8XAMCraFOftMP8DBgxHDNGqZp+QKwVPY/+60M
 zKNpHdhV048slvN/qxWI1BBcjObwPzFPDgCei4jnBiTABqjfo9Ux86Cn0Z5DYjVd6T/u 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ywapnx799-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:53:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C881C100039;
 Tue, 24 Mar 2020 09:53:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C036221FE91;
 Tue, 24 Mar 2020 09:53:13 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 09:53:13 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:53:13 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] i2c: stm32f7_i2c: allows for any bus frequency
Thread-Index: AQHV859LSS526B1VSk6Bb0l3HRWBNahXi+Yg
Date: Tue, 24 Mar 2020 08:53:13 +0000
Message-ID: <4b468349acb342c8b2a30dbfe89cea0e@SFHDAG6NODE3.st.com>
References: <20200306100914.9022-1-patrick.delaunay@st.com>
In-Reply-To: <20200306100914.9022-1-patrick.delaunay@st.com>
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
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Alain VOLMAT <alain.volmat@st.com>,
 Heiko Schocher <hs@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] i2c: stm32f7_i2c: allows for any bus
	frequency
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

Hi

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 6 mars 2020 11:09
> 
> From: Alain Volmat <alain.volmat@st.com>
> 
> Do not limit to 3 (100KHz, 400KHz, 1MHz) bus frequencies, but instead allow for
> any frequency. Depending on the requested frequency (via the clock-frequency
> DT entry), use the spec data from either Standard, Fast or Fast Plus mode.
> 
> In order to do so, the driver do not use anymore spec identifier by directly handle
> the requested frequency and from it retrieve the corresponding spec data to be
> used for the computation of the timing register.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
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
