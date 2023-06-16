Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B847732AEC
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 11:03:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03062C6A5EA;
	Fri, 16 Jun 2023 09:03:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0458C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 09:03:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G8UoSp015743; Fri, 16 Jun 2023 11:03:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xnDtC+xpEOARpw3PzK4MqAI2x2B5eFUzzvZ2WNjnilQ=;
 b=z+RUJa9D46PxplyHHgZ3JGFcQno0ouw5rJJcu3TRnzVAQ5kLwD9gNAm+8yT+KyDwT+Lm
 NR0d0UauaT+RlnYXwZ2ionBlkAO8/o5PtP6P67K7xcGwgVV6rwj9q2BtODTpvoI8eCmX
 DPPEQdlaw6Xx2YRZgauWI0Z5kYYW6Q7010yXdudZvrQ5k2eDMP/gI9udL4FzVPqYHhDy
 KwqcNVMtQbXCf2Iia8293Lzr+81NzVtXd8IKe5//JCYPQZvTQJ+RrmmmyEVGaQ8EZHXU
 y0TqaZdZui1svbey7EJk/5sFIjqADPY6h2Exo2q7VQLS7l5BJkRBtVnTZG5Qn/aRtPMx lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8fj99th7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 11:03:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59D13100050;
 Fri, 16 Jun 2023 11:03:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 540F721ED55;
 Fri, 16 Jun 2023 11:03:03 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 11:03:03 +0200
Message-ID: <72c4647d-a725-35ea-e659-d6784e8c7fec@foss.st.com>
Date: Fri, 16 Jun 2023 11:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230531060131.2045931-1-patrice.chotard@foss.st.com>
 <20230531060131.2045931-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230531060131.2045931-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_06,2023-06-15_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] serial: stm32: BRR must be set only
 when usart is disable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 5/31/23 08:01, Patrice Chotard wrote:
> To avoid spurious chars, BRR register must only be written when
> USART is disabled.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/serial/serial_stm32.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
