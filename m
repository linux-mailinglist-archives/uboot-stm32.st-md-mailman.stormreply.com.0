Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEC1907EE
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:44:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C71BCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:44:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FC30C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:44:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8btWb026657; Tue, 24 Mar 2020 09:44:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NDsFf6q01SDTRbyT0891+Ax6mGSx/F/igw6nvud/dzY=;
 b=Qvk4Cym1Omj5TA5LFXEOavfhImFGW/nuVx1i9EHcPm0hzxLlwyls4NmejgdAS8VUnWCY
 w56ZCw34q+XytMEvuTa/pG6VdgGIw70YQgmBWYPAA9fIduZ2cFJ3suVQaAU4TmSSv6Ck
 jxhi6XFOZT7tqLN292FAdneaLt+64AWvuHG+0FesI9QnsZ7tzS5g/E6T63ywEJh0mCar
 fVdtF+RLL4jFwtZLczixFpi83eb/SHxBOZwmvU7fYKdhR5e0tg1/2LtrzvxcqLUgBTPo
 IojZQniFZvqaRouUXydUnrm6/at6RGoYjdplr5Hnfa+x0sz+mzNnqjvUVyYy0YkWLiJP zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ywapnx5qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:44:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2012100038;
 Tue, 24 Mar 2020 09:44:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D895421F699;
 Tue, 24 Mar 2020 09:44:13 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:44:13 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:44:13 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] clk: stm32mp1: correct CKSELR masks
Thread-Index: AQHV9hrxpzqBo4Rs4kSLR9nHfqQ72KhXhCpQ
Date: Tue, 24 Mar 2020 08:44:13 +0000
Message-ID: <40b7006de05b44bfad743f7dda62c7c7@SFHDAG6NODE3.st.com>
References: <20200309135923.429-1-patrick.delaunay@st.com>
In-Reply-To: <20200309135923.429-1-patrick.delaunay@st.com>
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
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: stm32mp1: correct CKSELR masks
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
> Sent: lundi 9 mars 2020 14:59
> 
> Correct three masks used to access on the RCC register RCC_QSPICKSELR,
> RCC_FMCCKSELR and RCC_ADCCKSELR: only 3 bits.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
