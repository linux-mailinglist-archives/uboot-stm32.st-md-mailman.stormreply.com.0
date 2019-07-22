Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ACA6FFBA
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:33:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5590CD24CC
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:33:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4204CD24CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:33:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQuN4027722; Mon, 22 Jul 2019 14:33:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fJ1WMKFZFdtzJLxKQsfh0ZXLAZyhEVUwPZ87HKg1eNs=;
 b=PyOu0EAaLlH6QQ0zKJuwWUi5q3zYaLyPsjx0seMkMGxZOZ1vktw1P3DLnEKPOtgwUx2W
 TQLRlYSAhissWngM4jzrFo+DWPN4fX77EQWFvNH9CVKFVBkWr6BgtBoI+7X+weK/XL6M
 nzHRfcsn3v4n5EbjHqTnsPdM+du0lziO+ezoonkgHaJmV6ta5aiIB1Xr6LFK2AWr24Lh
 V0XChKHEBqo0Vp/XJWqrDqESkzGz+fSMKlP/hPBc1BacxOK0FyZ6lkRMQLM2fxTOKcid
 /N16B4jvTkVsVS9VeUEnaaJ3yvfAby4u6FPsVCGJPNRgHYkrPRs8FxjWl9IDF/Vdq80Y Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tusuj3c20-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:33:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 221F73A;
 Mon, 22 Jul 2019 12:33:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12EA02B5A;
 Mon, 22 Jul 2019 12:33:53 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 22 Jul
 2019 14:33:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:33:52 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, "sjg@chromium.org" <sjg@chromium.org>
Thread-Topic: [PATCH v3 1/2] clk: stm32mp1: Add RTC clock entry
Thread-Index: AQHVN8/ts8KjJWrlJkymSu4Zh/3406bWo7og
Date: Mon, 22 Jul 2019 12:33:52 +0000
Message-ID: <1a8ea1020a664908b285d775c2d47d41@SFHDAG6NODE3.st.com>
References: <20190711100338.1327-1-benjamin.gaignard@st.com>
 <20190711100338.1327-2-benjamin.gaignard@st.com>
In-Reply-To: <20190711100338.1327-2-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_10:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 1/2] clk: stm32mp1: Add RTC clock entry
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

> From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
> Sent: jeudi 11 juillet 2019 12:04
> 
> From: Patrick Delaunay <patrick.delaunay@st.com>
> 
> Add RTCAPB and RTC clock support.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>  drivers/clk/clk_stm32mp1.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
