Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE410B073
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 14:41:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72ED1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 13:41:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EDBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 13:41:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARDeBuG028728; Wed, 27 Nov 2019 14:41:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=XXXTzFba9yqf3e2fxl6cjp5265nLmyXKq4cqcZpXHAg=;
 b=TrOkVGNSDwf9xxvMHDD88cT5pw3BcXl9XyBsiLE2qM7pRpyGlX6m1EqTA7hcdSvG1+Pw
 7iEjt8eWJ0pDorhHtBCzRgDeuFibICBA0LIKbDHG+ZsEGqRaH07xWFgspCUraPq1s1rY
 /nSxN7Ha49oo7kodhPtB2qxOJxYOklv7ZVZAsSiQY89h6+B3+QIgsfiCtIzvsiIiO8Os
 mbZ+um8vyMrMhxH5ArZhTIVo3HxSrNNLwxAm3Kb3vOTLM0usGqeMEk+RspRb6h2nYovz
 ELkqbC5qTdMTlCK2wXsFnv0ODhfzHaHv3H01xjyxxDedFCH0fn5pqXJbZdReoHT73mqE Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxsby1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 14:41:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D242F100038;
 Wed, 27 Nov 2019 14:41:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C95EB2B9916;
 Wed, 27 Nov 2019 14:41:11 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 14:41:11 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 27 Nov 2019 14:41:11 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 15/15] stm32mp1: add support for virtual partition read
Thread-Index: AQHVgmD/tFI7JhhiokWHpsP/OqHW3KefS9KQ
Date: Wed, 27 Nov 2019 13:41:11 +0000
Message-ID: <1ee75e85c52a48958ff95ff3d7c7e170@SFHDAG6NODE3.st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-16-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-16-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_03:2019-11-27,2019-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 15/15] stm32mp1: add support for
	virtual partition read
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
> Sent: lundi 14 octobre 2019 09:28
> 
> Add read for OTP and PMIC NVM with alternates on virtual DFU device.
> 
> Serie-cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

-- 
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
