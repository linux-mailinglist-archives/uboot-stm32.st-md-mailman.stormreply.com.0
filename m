Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7411D1B15
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2020 18:32:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CA42C36B10
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2020 16:32:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EE2C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2020 16:32:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DGSIPl020613; Wed, 13 May 2020 18:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vghBqsBsucrLKoHhE3KzcnXAlbmXrFm2zr9QYqZFpCA=;
 b=QzOjdeDp5wdeFyPHTjghrFtpi67AP4dQPhTH41qpoehDS4sqCU2aw0+PNqURXnR4hntl
 yFE02j8CSShLxFzK3ruD53j6hUOUc1e/GylBYebsgP2WOk5bseupoCoktMkO0rqXMQPu
 ptJy5VcaNQFoqykrIs4z3aDnQ1LnQGZEPo8ptk6C2erOs0ykvRkX7ElYPIJCAZSVF+tV
 nkPYlS6oeRO+vV/UhyBfLiNsaIKI3ZIxHEJrcLsS6h7JbSrJlzH8eQ3eXKIRt3xXK4yv
 hemArxv8NY/vtAgR8Omv7U34au36NhnVIJV1QcOImlQaYV+8bb/Ndgnq63AciOjUeJi+ iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpdwhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 18:32:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E164910002A;
 Wed, 13 May 2020 18:32:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBB5B2D3038;
 Wed, 13 May 2020 18:32:05 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 May
 2020 18:32:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 13 May 2020 18:32:05 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 8/9] board: stm32mp1: update vddcore in SPL
Thread-Index: AQHWF+8vsN/gB9Mb3ESX2y4AWg7r2aimVz+Q
Date: Wed, 13 May 2020 16:32:05 +0000
Message-ID: <0bfd3ec12fd8464ba920dc0d62187043@SFHDAG6NODE3.st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.8.I6f11a8bc7a6681ab18c3bbbc1ac73cbdac030982@changeid>
In-Reply-To: <20200421171123.8.I6f11a8bc7a6681ab18c3bbbc1ac73cbdac030982@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_07:2020-05-13,
 2020-05-13 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 8/9] board: stm32mp1: update vddcore in SPL
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
> Sent: mardi 21 avril 2020 17:11
> 
> For board using STPMIC1, the vddcore is provided by BUCK1 of STMPIC1 and
> need to be updated for 800MHz support and only after the clock tree initialization.
> 
> The VDDCORE voltage value in provide by clock driver, saved in global variable
> opp_voltage_mv and udpated SPL in board_early_init_f().
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Ok for ST board boards but compilation failed for 
stm32mp15_dhcor_basic / stm32mp15_dhcom_basic

+arm-linux-gnueabi-ld.bfd: spl/board/dhelectronics/dh_stm32mp1/board.o: in function `board_early_init_f':
+board/dhelectronics/dh_stm32mp1/board.c:196: multiple definition of `board_early_init_f'; spl/board/dhelectronics/dh_stm32mp1/../../st/stm32mp1/spl.o:board/dhelectronics/dh_stm32mp1/../../st/stm32mp1/spl.c:28: first defined here

need V2
with rework for board/st/stm32mp1/spl.c
and better split for DHCOM SOM

regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
