Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F175C2813C2
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 15:10:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2475C424B3;
	Fri,  2 Oct 2020 13:10:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 472DBC424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 13:10:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092D6tn4004771; Fri, 2 Oct 2020 15:10:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2Q8xHg+mtUmd7dpqU+8EBfVFRLsQTBNpsqBYmXj8D4c=;
 b=JG11NkQWAR5FnyDlgPoZ/l4BSGTEKApnUey3Jn6K7CN0EnJBsCgXOoqhfoiVdZptvOh9
 dF3iz7u//Qts5MLPMZu0Mw/GoDJ90GWw7TOFrZyjsaH44u3ovW4iFhRukjPt8z6athPN
 fQs3/V7MJo169eHcbTqIy/GeJtpFb0hjot+I8ynPm10BHJQ5IsLPsenyDlWMXRWtoosY
 BnhcXxClyX8w4tMZoij3vdON3nZP3eLcHnnV3dbFRqMVmCYAqRQwvcnYcFHeI4AFL4dr
 R7LidsB6j7fuQ3FaQceTFQ48CZfaEnstMoO755Sw1x5VYM7XU4zayNZBmDk6H8gjkbLA Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts8btrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 15:10:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3DBF100034;
 Fri,  2 Oct 2020 15:10:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97F282C38AD;
 Fri,  2 Oct 2020 15:10:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 15:10:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 15:10:00 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] video: stm32_dsi: Convert to use APIs which support
 live DT
Thread-Index: AQHWhsAZpuv0l3J+nk6yVAO4DyPKyKmEbQ4Q
Date: Fri, 2 Oct 2020 13:10:00 +0000
Message-ID: <94403bd25b964f7b9721b6b72f15b00d@SFHDAG6NODE3.st.com>
References: <20200909154413.28064-1-patrick.delaunay@st.com>
 <20200909154413.28064-2-patrick.delaunay@st.com>
In-Reply-To: <20200909154413.28064-2-patrick.delaunay@st.com>
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
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] video: stm32_dsi: Convert to use APIs
 which support live DT
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
>  drivers/video/stm32/stm32_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
