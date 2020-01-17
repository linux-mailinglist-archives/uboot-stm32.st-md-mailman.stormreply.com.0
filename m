Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D471409DD
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 13:38:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FBC2C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 12:38:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87B3BC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 12:38:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCbC8k008189; Fri, 17 Jan 2020 13:38:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5OoqFvWieTM3ZdRuktEqgVwgf1YVUcWxsqq6ldt3hs8=;
 b=SQ6ECG+prhzTkiFUyVql8UrsEA0KU09ssrCR4WT6A+Ctsa7AvZsUwMTxQc6LYxHzep2O
 C2Gu6BnUUnWyaPSB7OuIR4F5xHdYReHflQD+4Xx3F1HRsXudRvW/iuTRi2XGFFJXH1c+
 oBLppYMXA1evrlwqsZgrtP8a2GnKe01X+ztX9UTkasEcGjwhOcyUORqtEVSWB6yX/UV4
 myCTucFv79JXfOCTH3SNd1WGYKTR8u2X3V19yzHSFXNg3UwUMe31K5+qdx4yS9xXkYt8
 3nP9p845PGKg8uJecMGy/Wswp4erejkWBy6CnrZoiuH1hPurFDtGzAWAMG8bcy9Wix6y JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0qy3fjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 13:38:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B5D610002A;
 Fri, 17 Jan 2020 13:38:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 207432B7726;
 Fri, 17 Jan 2020 13:38:09 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jan
 2020 13:38:08 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 13:38:08 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Thomas Hebb <tommyhebb@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] stm32mp: remove redundant SYS_TEXT_BASE
 prompt
Thread-Index: AQHVwUUtykqs9jpRqUG1blw4VmZVL6fu4ytw
Date: Fri, 17 Jan 2020 12:38:08 +0000
Message-ID: <7269251e6ffd44e29e29ea15d3299692@SFHDAG6NODE3.st.com>
References: <83634bb5ffff308a693021bf2729742c0b30b2cc.1576893816.git.tommyhebb@gmail.com>
In-Reply-To: <83634bb5ffff308a693021bf2729742c0b30b2cc.1576893816.git.tommyhebb@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: remove redundant SYS_TEXT_BASE
 prompt
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

Hi Thomas,

> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> Behalf Of Thomas Hebb
> 
> The main prompt for this (defined in /Kconfig) is visible at all times, which means
> there's no reason to have an additional, machine-specific prompt to set the same
> option.
> 
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---

Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm32/master, thanks!

Regards
Patrick 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
