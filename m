Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABD670DC
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:01:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4A87D40C14
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:01:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D9C1D40C0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:01:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CDuFwv017560; Fri, 12 Jul 2019 16:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Lq/FHa0WazYUW1JvS+/p6PAEacMhuGo8kiK3Lhtd4Fs=;
 b=yyzpmdFSHhxtxSt0HFn0whZIN2/26HSobzMDZ9UGB18W+mVcF343Kkm01pTn5kS33Cy9
 9DPNLR1FW6Fy01150jLNRe+OSDRPJXibW5oV35zisZV4FGg7yfmwy2UkhUzN0/M3mi7Z
 /USNKAAV69npr8Zb/QR0ObkCJVHURwHegglRrV3kAmyVp1nu9iQU5m8Ys6Afk+Zwqv6Z
 T4d1mTf54reVdWQ8Jc7ImxAKJi/9WtidjN5ZxgOJDo+ERNO7bCTj/R1o+mV4IpwQbf0a
 FH3HeqdG82bmN3LnH0pMsspi0NoX0bb9CmpLeTBiqhKro83KPRYXxT9nAmM0bP468awU 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmh51rs9v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:01:21 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E1A446;
 Fri, 12 Jul 2019 14:01:21 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49B2B4E4E;
 Fri, 12 Jul 2019 14:01:21 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 16:01:20 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:01:20 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 07/20] adc: stm32: Fix warnings when compiling with W=1
Thread-Index: AQHVKDUKdiMQDaRIhEejqvS38KiJzKbHI1SQ
Date: Fri, 12 Jul 2019 14:01:20 +0000
Message-ID: <bf01ee8f2ca2473a8ffb73350c2c6408@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-7-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-7-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 07/20] adc: stm32: Fix warnings when
	compiling with W=1
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
> Sent: vendredi 21 juin 2019 15:27
> 
> This patch solves the following warnings:
> 
> drivers/adc/stm32-adc-core.c: In function 'stm32h7_adc_clk_sel':
> warning: comparison between signed and unsigned integer expressions [-Wsign-
> compare]
>    for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
>                  ^
> warning: comparison between signed and unsigned integer expressions [-Wsign-
> compare]
>   for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
>                 ^
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/adc/stm32-adc-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
