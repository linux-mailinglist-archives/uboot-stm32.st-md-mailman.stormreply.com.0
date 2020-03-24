Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885A1907F0
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:44:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4EB2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:44:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7699FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:44:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8beUL023970; Tue, 24 Mar 2020 09:44:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Lbqm9WXbkptck+pO6Hmgcdn0fHocL11ivs4m2G45p+g=;
 b=SY7+Ioul4DrB6ag2v89ONvMaulFigGc00VqweSEgNixB3/eKDVbx1LPRNfIM6kd9iT/l
 AElCovqllFtfJorGheQsw/ZrZCvQw5soEjXEa76APhc7OTAzHPxJ2gfH3F5Da4+ncAdx
 Iy8TWuaYuo61rXfrExOrw06cI+16+r2SPxTDNq5CoAELOVxlVYhfQbvaeS7vBnneF8s4
 rTn1ucSyACpjGAbNezQ+5+cbFXoiL1Jh96uQMExyFR1e+T/A5nPSgDtXl33nk6zrZc6C
 V8brIsmtfs1wf1foXiDEuEzDta0LFr857VvePKPa9n709NPFQpRKMD+3/F6pbxJ1bRem GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995edsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:44:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7E5310003A;
 Tue, 24 Mar 2020 09:44:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF07D21F699;
 Tue, 24 Mar 2020 09:44:36 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:44:36 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:44:36 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] clk: stm32mp1: add SPI5_K support
Thread-Index: AQHV9hry+1+tptdK2kiPrmV1D2bu2qhXhJWQ
Date: Tue, 24 Mar 2020 08:44:36 +0000
Message-ID: <c4a2bd957a124b3cb84c4329b97264fe@SFHDAG6NODE3.st.com>
References: <20200309135923.429-1-patrick.delaunay@st.com>
 <20200309135923.429-2-patrick.delaunay@st.com>
In-Reply-To: <20200309135923.429-2-patrick.delaunay@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 2/2] clk: stm32mp1: add SPI5_K support
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
> Add clock support for SPI5, as this instance is available on extension connector of
> ST board.
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
