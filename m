Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3047B7BC2
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 11:19:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C449AC6C832;
	Wed,  4 Oct 2023 09:19:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8145C6C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:19:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3945RSr9021989; Wed, 4 Oct 2023 11:19:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:from:subject:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Yoqj9Xe8Qj4FtA0LXijqBrEf9f1Vo/uww1tHl+ucB64=; b=pX
 +/b3iP3wkvWsukcc6T+vx2ZXnDYyhLgZ5kI8Av41rzp+TQ2enWLImCYDzcds1Ma+
 DUk1CJvzDNYjtM1/V0iaSD3TYSl9s5PrNnjQX89tyxUi+/HGr12hzgTzDYv+WkdF
 pZVkvKNrRpX/oC9S1omsuFoHnJywu9RWRto0eaeXX5vneLLfwdVJ3K+W1f7yZem7
 B/ZaVuaXxvuKm7zqH23L8S92953wIEbvkKy5KZ6/lD9yhk83LteFq+1UxZsYTvBL
 iePOFT2hAii+VUE00mIDHUUhUmNUMrPzTgYV7F9nvWsyei3ozH1nx1k1pudpyzkP
 ajIgp0kCST6dV8NX1mAg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3teajd059g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:19:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC268100057;
 Wed,  4 Oct 2023 11:19:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D46F422A6E4;
 Wed,  4 Oct 2023 11:19:17 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:19:17 +0200
Message-ID: <756093f5-d3da-eeae-9619-763e48d297cc@foss.st.com>
Date: Wed, 4 Oct 2023 11:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, Harald Seiler <hws@denx.de>,
 <u-boot@lists.denx.de>
References: <20230927124625.247858-1-hws@denx.de>
 <7943bfcb-204d-526d-9208-fd38fbc567b4@denx.de>
Content-Language: en-US
In-Reply-To: <7943bfcb-204d-526d-9208-fd38fbc567b4@denx.de>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Only print board
 code with CONFIG_SPL_DISPLAY_PRINT
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



On 9/30/23 23:02, Marek Vasut wrote:
> On 9/27/23 14:46, Harald Seiler wrote:
>> Ensure that the SoM and board code information is only printed when
>> CONFIG_SPL_DISPLAY_PRINT is set.
>>
>> Signed-off-by: Harald Seiler <hws@denx.de>
> 
> Reviewed-by: Marek Vasut <marex@denx.de>


Apply on stm32/next

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
