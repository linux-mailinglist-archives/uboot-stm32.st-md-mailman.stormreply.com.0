Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48696140D83
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 16:12:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12BECC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 15:12:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12FFBC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 15:12:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HF73Re030655; Fri, 17 Jan 2020 16:12:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oyem8O4SLypKJMaP+RDp+Pqs0PAZgoS1XNOKMMojeAE=;
 b=OSNbn0ieLqzT2pA3uVV5F5ZA7gDMiSPjyVOJQmnDO+as5dtJjvAthhdskrpgnFjWGpNz
 kbLlKTrC+882F2g1Ig4dc0nLZe4fPG2OckjWe59zjQq4A0vPOAjXlfGtL9K3PQc/NH3x
 IYqF+WBxIhEJu8gnDrqkoD7ynkbnIpgZzlyMBZIwTUVnkCW8fD6OVVn3j/Ruj7GvvyYv
 Dtr665tCDd5rrMZrq9HaJm+1fp0qAaUEF2helJvA+6ek6nCp/ArOoETXwcjGcQ9dEH7n
 ILNeSMUBDMtNju9cRsURDTDTd7Tuj8tBOySnWPVXu421MO7I/mwEEE5s0RKWbvstyCPe bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0qy44qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 16:12:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06BA5100034;
 Fri, 17 Jan 2020 16:12:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0D882C38AE;
 Fri, 17 Jan 2020 16:12:03 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jan
 2020 16:12:03 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 16:12:03 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] board: stm32mp1: move CONFIG_ENV_XXX in defconfig
Thread-Index: AQHVyhw7ynx0DXsM80uxao0kjClvY6fu/KSQ
Date: Fri, 17 Jan 2020 15:12:03 +0000
Message-ID: <c5eb55c4ce3a4206b3373b66d413a830@SFHDAG6NODE3.st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
 <20200113141742.28182-3-patrick.delaunay@st.com>
In-Reply-To: <20200113141742.28182-3-patrick.delaunay@st.com>
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
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] board: stm32mp1: move CONFIG_ENV_XXX
	in defconfig
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
> Sent: lundi 13 janvier 2020 15:18
> 
> Move CONFIG_ENV_SECT_SIZE and CONFIG_ENV_OFFSET in
> stm32mp15_*_defconfig for ST board with NOR support (STM32MP15xx-EV1
> boards)
> - CONFIG_SECT_SIZE values = the max supported NOR erase size (256KB)
> - CONFIG_ENV_OFFSET = offset for NOR (ENV_IS_IN_SPI_FLASH)
> 
> This Patch prepares the U-Boot support of boards with STM32MP15x SOC not
> provided by STMicroelectronics.
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
