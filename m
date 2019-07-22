Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDA6FFA2
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:28:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F43DCD21CC
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:28:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B24B4CD21CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:28:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQcCA004993; Mon, 22 Jul 2019 14:28:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=afbe14gzUNNAWUXoUJQyjdTFpQZAEW/8IIgoHtP9GEg=;
 b=kyLa2HyYX/nn6pb79YrdVCFQiZySHy1jLg4DSFoojxFCOfEb1F6mWDLGcEwhSLn8jVqn
 XU4KlX9qzcqITiQA/04Bb5i7l6lzOBdyJpsb/gYgpSxVYgEq+pD0smN1+9W1pjC/C7t1
 k3l6yTJfr63FebIV8CH8uzIava/r5/Agx4+WPMFIL5KSrCqU78hkCsi+5kMhyMbXCLo4
 q71H0VRsf7w/NqAgkBpBhoACjDhtMvOozNWT0WgLJEqpxCbz5ifqAg0Ly5unTlQR6smK
 fslm7sLLXdIR33+fDoNhXkh/9y9zd63hGg4V04HscOGn28kENAPK4Ju8lxYT0xIwSxES IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tuw7w2bs0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:28:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C55EC3A;
 Mon, 22 Jul 2019 12:28:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8396B2A88;
 Mon, 22 Jul 2019 12:28:53 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 22 Jul
 2019 14:28:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:28:52 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Christophe KERELLO <christophe.kerello@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, "Andreas
 Dannenberg" <dannenberg@ti.com>, Loic PALLARDY <loic.pallardy@st.com>
Thread-Topic: [PATCH v3 3/7] remoteproc: add device_to_virt ops
Thread-Index: AQHVF7JmFYe2x1LxiEuKPsuInA1Ef6bW4o8Q
Date: Mon, 22 Jul 2019 12:28:52 +0000
Message-ID: <e4fd61cba0894dd08a1316a299244a01@SFHDAG6NODE3.st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-4-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1559308296-17027-4-git-send-email-fabien.dessenne@st.com>
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
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/7] remoteproc: add device_to_virt ops
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

> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: vendredi 31 mai 2019 15:12
> 
> Introduce the device_to_virt function to allow translation between device address
> (remote processor view) and virtual address (main processor view).
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  include/remoteproc.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
