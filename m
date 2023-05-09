Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D336FC605
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 May 2023 14:13:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D02B3C6A602;
	Tue,  9 May 2023 12:13:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A4B7C6A5F7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 12:13:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3498hDet000931
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 9 May 2023 14:13:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=blFWou+OPE30GF+PMQ4y3w8p5E2gywgdz0cQOuwopR4=;
 b=bHewerka0WWLRjdyK7qwAsd+yilyv2TyysYXEwkMxwOkoxLNYCHEj4tFSEkqKzNGmbjK
 rWY708o3UcDcoYcvQQ+f8xDl9jnK0gYjIooJBLN+UlMEUJIAFlvCjAt0vNGDbnboh82K
 GG4TB5z42YOD+s4YtoF8FQUPJYnkd0YpDQarRTQSogSydpP+lvenua2CYmC9RUnU55Og
 Tx0nBmJXh+giWzMh9PvtYF2xn/RtLht6Gu1gBNOyzAqPxUWU+X6A41FRGZFlCoBoEDV2
 +HvNYO758qDnTtbTq740tjVXKpB6Pa6rYHWaI3HnFFnKAJ95O/a+z7pIkIP2hMbmVndE zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf787csvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 09 May 2023 14:13:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0455110002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 14:13:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFD4B21B539
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 14:13:10 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 14:13:10 +0200
Message-ID: <b504c78e-de3a-b1a4-0fe4-8e041fc492b4@foss.st.com>
Date: Tue, 9 May 2023 14:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
 <20230424162102.v2.1.I7a9b5c8f2d337c2f3c11bc6c5f0320a9474bcb49@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230424162102.v2.1.I7a9b5c8f2d337c2f3c11bc6c5f0320a9474bcb49@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_08,2023-05-05_01,2023-02-09_01
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] media: dt-bindings: media: Add
 macros for video interface bus types
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

Hi Patrick

On 4/24/23 16:21, Patrick Delaunay wrote:
> Add a new dt-bindings/media/video-interfaces.h header that defines
> macros corresponding to the bus types from media/video-interfaces.yaml.
> This allows avoiding hardcoded constants in device tree sources.
> 
> Based on linux commit f7eeb0084593 ("media: dt-bindings: media: Add macros
> for video interface bus types")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 000000000000..68ac4e05e37f
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +
> +#define MEDIA_BUS_TYPE_CSI2_CPHY		1
> +#define MEDIA_BUS_TYPE_CSI1			2
> +#define MEDIA_BUS_TYPE_CCP2			3
> +#define MEDIA_BUS_TYPE_CSI2_DPHY		4
> +#define MEDIA_BUS_TYPE_PARALLEL			5
> +#define MEDIA_BUS_TYPE_BT656			6
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
