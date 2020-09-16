Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6426C2E7
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 14:45:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76518C3FAD6
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 12:45:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 684CCC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 12:45:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GCgaHS013828; Wed, 16 Sep 2020 14:45:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MSX8kGc14gvvc5YnjMaWhaOzpweQqTD8TDpmM7kuAao=;
 b=RtcSnlIlPr0mmKy8chn9YYyFKHz8s8cbKeFh/d/ISK/2tB4oXd2A3EhC/JhhJBdBVMo8
 scJUE9GvXa/dC9ogJHt1KdGYDdLYEa+4+NRnOiZ0GEmN/9u6tnHS5YflLvtaQr6Wr9qp
 90z7i2qHQg+BZQiTOTM3ssWvaTTTMS2FRVfR+pcOPQsTiEN4XwCmPYTVqweaHPmQl70u
 jZm7Y39WdIzQ5LKDF+SFaWIJAuwy8TNTsB6o0cbOHfWAFkI0j/fwGENN+11a0f0SazZ+
 3Auc4Cem023YkhCKdgCdzyqC/ybmuqNmeEV/CQIk8vObuVvw1rljHmIwyZcXsvvUtB0H zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k67bmas6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 14:45:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D521A10002A;
 Wed, 16 Sep 2020 14:45:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB4012AD9FF;
 Wed, 16 Sep 2020 14:45:26 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 14:45:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 16 Sep 2020 14:45:26 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Sean Anderson <seanga2@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 30/46] phy: usbphyc: Fix not calling dev_err with a
 device
Thread-Index: AQHWi2704mM31U6GWEKwKxaOwW7OValrN4NA
Date: Wed, 16 Sep 2020 12:45:26 +0000
Message-ID: <8cf0889ec06343e896461810f6e3a4dc@SFHDAG6NODE3.st.com>
References: <20200915144522.509493-1-seanga2@gmail.com>
 <20200915144522.509493-31-seanga2@gmail.com>
In-Reply-To: <20200915144522.509493-31-seanga2@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_07:2020-09-16,
 2020-09-16 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 30/46] phy: usbphyc: Fix not calling
 dev_err with a device
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

Hi Sean,

> From: Sean Anderson <seanga2@gmail.com>
> Sent: mardi 15 septembre 2020 16:45
> 
> Use the phy's device.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
> 
> Changes in v2:
> - New
> 
>  drivers/phy/phy-stm32-usbphyc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
