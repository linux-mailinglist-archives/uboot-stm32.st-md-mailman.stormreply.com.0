Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9F010B063
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 14:38:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAB65C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 13:38:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB74C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 13:38:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARDM1Qd000763; Wed, 27 Nov 2019 14:38:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zGlmilQePtgDeIXHnfu+WX9qLrLJbkz6lsdOwcpmWsw=;
 b=Yyw1VECLkxIKp1ZlxbxQdghqsHbkPJIqq9Ec29qHUWrGv7VgtsUJzoITxu8EC6VVkffr
 V7KF5/QdnL9Ba+vmmQWe5K8cBA7xUaPYwaBSairlcqL7E5Xcp9LLtMvXjC7Z4Y14rGPJ
 GYT2M/gsTsF3ptlfcaZTs/aSLcZ13+3fXvUpvCFF/7pgWAXdfflOF1RoTWF5CNb/llxC
 /FOMnsBEpzMjbWjcbFzlznk+BgqZh/3ZX9udisUlqzqJ1KjpMShw2U/6HmIiMaCY+etk
 QJiugHuqkC/yf/nt7LQGXof1da4PIJVwypVdwdddUzvKAinMRw8PGaYyNgRzgzPjObgc Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxsbxhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 14:38:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11ED310002A;
 Wed, 27 Nov 2019 14:38:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 063AA2B9913;
 Wed, 27 Nov 2019 14:38:09 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 14:38:08 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 27 Nov 2019 14:38:08 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] ARM: dts: stm32: update eMMC configuration for
 stm32mp157c-ev1
Thread-Index: AQHVlLU35ENQ7AV4eU64RfYiGHmEW6efJkrA
Date: Wed, 27 Nov 2019 13:38:08 +0000
Message-ID: <00dd941fc9f44675801847acb40aeafe@SFHDAG6NODE3.st.com>
References: <20191106151634.7834-1-patrick.delaunay@st.com>
 <20191106151634.7834-4-patrick.delaunay@st.com>
In-Reply-To: <20191106151634.7834-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: update eMMC
 configuration for stm32mp157c-ev1
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
> Sent: mercredi 6 novembre 2019 16:17
> 
> Update the sdmmc2 node for eMMC support on eval board stm32mp157c-ev1.
> - update slew-rate for pin configuration
> - update "vqmmc-supply"
> - remove "st,sig-dir"
> - add mandatory "pinctrl-names"
> - add "mmc-ddr-3_3v"
> 
> This patch solve the eMMC detection issue for command "mmc dev 1".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

-- 
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
