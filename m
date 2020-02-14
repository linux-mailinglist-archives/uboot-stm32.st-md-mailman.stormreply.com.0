Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8C15D591
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 11:27:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ABC3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 10:27:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D27F9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 10:27:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EAN1H2023631; Fri, 14 Feb 2020 11:27:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=u9zX57VsnxgUlweTJ13y0B6ctx0mfqDQxbNH/tJeIik=;
 b=KpZCb2IrX8iPdMkxgqkTUAQSxwV09BkNS4akTM7IAYPX3fBOr3R6ZPM8qD7f/yhf1mrS
 XKMR4Clzp61EQY+RnarXZAXLbwdHuPO7hhimtGpp+2wZeIxSootVjUrK9B9lvG+o6R0o
 zeCJ1Pj46u2qpCJ6fyiaENWstwbJM3nDd/3XsG2JYRez5/X9JMf/zyhp3lamEWmgDOXa
 QCCfkLpTjwt3TRQD7rHFELUBXvBZEQrzYatRFP+6PQ74MW+NUNzJkTrA+ZapnRTiF24n
 YauvILmDHWEu518F7U1bBDlnVf0Op5+roIPksRv7KIN6xQvaXzTm3XkJH4N7qiXo0RD2 Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhu2s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 11:27:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EB4310002A;
 Fri, 14 Feb 2020 11:27:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 268B32AC879;
 Fri, 14 Feb 2020 11:27:08 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 11:27:07 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 11:27:07 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 5/9] ARM: dts: stm32mp1: correct ddr node
Thread-Index: AQHV1brt+tSr1DKX0kCrvmceBodmYagalw3Q
Date: Fri, 14 Feb 2020 10:27:07 +0000
Message-ID: <096f58bb2bfc462ebaff185b3217924a@SFHDAG6NODE3.st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101042.5.Ic4ce0ec17e761c1e8458602a341cb9c806aed270@changeid>
In-Reply-To: <20200128101042.5.Ic4ce0ec17e761c1e8458602a341cb9c806aed270@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 5/9] ARM: dts: stm32mp1: correct ddr node
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
> Sent: mardi 28 janvier 2020 10:11
> 
> This patch fix the warning:
> dt.dts: Warning (simple_bus_reg): Node /soc/ddr@5A003000 simple-bus unit
> address format error, expected "5a003000"
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!
 
 Regards
 Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
