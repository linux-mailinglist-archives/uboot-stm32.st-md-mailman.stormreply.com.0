Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5D645DC9
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 16:42:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03FAEC6411C;
	Wed,  7 Dec 2022 15:42:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D45EC01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 15:42:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7EVpJq015494; Wed, 7 Dec 2022 16:42:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zm76VzN4WU8zJzuUQYxKUHa3A3NZ76UR+sHt25tZZiQ=;
 b=Y4y3UF+LGXjAVSBlg7OXXZ8vfJVuL5kNvanTjMn244/zn/OajqmSBv8F588SMvOxA+/z
 ymC9sHPPvWUS5Bt+SHDIrvNGzT4H7WFCtabwnfLiUmKjEpLgtWMSOMUhuDc1hWczSGna
 Jez5oO9a73YyLd6l3jcIrzoZfjpVt64pyrUqDHidLEgRUOYS8p8yIU5rDbRajc2+sZ/m
 ClXqXsFKi9V5wiGZROJv7+gu2QF4zVv+YuCvDM8Pb8YPfSG55e39V5Y5IibTPgymHbq1
 +lpHa0oMWQ+Ao1KV2FMFuKescJaUfgxYVf5Z9bSzDorZe0bUjRSXSGh6cbjbKyj4uXpa Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vff1jsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 16:42:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA2A5100034;
 Wed,  7 Dec 2022 16:42:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6EAC237D60;
 Wed,  7 Dec 2022 16:42:43 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 16:42:43 +0100
Message-ID: <d94cfcae-e92d-1195-9571-9a3d8c7712e9@foss.st.com>
Date: Wed, 7 Dec 2022 16:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20221124103605.298002-1-gabriel.fernandez@foss.st.com>
 <20221124103605.298002-2-gabriel.fernandez@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221124103605.298002-2-gabriel.fernandez@foss.st.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] dt-bindings: stm32mp13: add clock
 & reset support for STM32MP13
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



On 11/24/22 11:36, Gabriel Fernandez wrote:
> Add support of stm32mp13 DT bindings of clock and reset.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> ---
> 
> Changes in v4:
> - update MAINTAINERS files
> 
>  MAINTAINERS                                  |   5 +-
>  include/dt-bindings/clock/stm32mp13-clks.h   | 229 +++++++++++++++++++
>  include/dt-bindings/reset/stm32mp13-resets.h | 100 ++++++++
>  3 files changed, 331 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>  create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
> 

[...]

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
