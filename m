Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3592813C0
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 15:09:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FB1AC424B3;
	Fri,  2 Oct 2020 13:09:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80834C424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 13:09:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092D7a1v032709; Fri, 2 Oct 2020 15:09:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Dj5txA3TUOmaUdF/gyx5r0Rk3p9TySmUsCpN4xI4/S4=;
 b=1LlxROtT65r+0CjeBVQH7niICi/ImaG1gwq0l1QWgqoTXbeDhDqmLmQ9Iut/hPKbh4lD
 m+ydYLoIiOZVSJJl6VjG2X8LCmyS/NCFjKm7LbX2WwLdVVDj5sEWIY68Km9gPIJ+fQdI
 DfkiVKDyFdxRqDOh/wOaNYzGvjrb++2u21NUE9gDkjkZXoMKLtigs46w6U3+4cjhESfX
 fFOI7dNjrLeDFO36/YYJ8FmUErs462vrhRCCLPd6Ki0PjR/XtSDHvmj8akCvZtl9kcZ6
 wNHDpKOYyI/14XLs/yeEBdwC0NtP6QTMp/lSL0aSk4kmPDAkH2ZMHoex/lHjY35z7kKa tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33v0dhbd0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 15:09:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE58D100034;
 Fri,  2 Oct 2020 15:09:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC3AE2C38A9;
 Fri,  2 Oct 2020 15:09:21 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 15:09:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 15:09:21 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] video: stm32_ltdc: Convert to use APIs which support
 live DT
Thread-Index: AQHWhsAY3uDj7K7+mUuKfVCBjYwpM6mEbKxQ
Date: Fri, 2 Oct 2020 13:09:21 +0000
Message-ID: <b52b537451b94d15ba2cf45e24d4f194@SFHDAG6NODE3.st.com>
References: <20200909154413.28064-1-patrick.delaunay@st.com>
In-Reply-To: <20200909154413.28064-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Anatolij Gustschin <agust@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] video: stm32_ltdc: Convert to use
 APIs which support live DT
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
> Sent: mercredi 9 septembre 2020 17:44
> 
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the driver can
> support live DT.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/video/stm32/stm32_ltdc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied to u-boot-stm/next, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
