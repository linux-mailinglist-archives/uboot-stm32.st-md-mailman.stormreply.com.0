Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 907CC5A6345
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 14:25:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C1DAC5F1D3;
	Tue, 30 Aug 2022 12:25:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A2E3C03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:24:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U9QRxh018055;
 Tue, 30 Aug 2022 14:24:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UJ21xwIiByMoEKTk/fLCzWhajCYBjMmKM6c4KDVFETc=;
 b=jDQwoRiFBnFOzTuk4jOKvQIWYihqapna8fh0zSu/XhyTvuSH24Xm6I3+TmBGaF+wT0KX
 QAUy2YqDnVetZr04ZzWdfN7xszHrhMvjAstzmsvRYWMIgSlVBTlIhzIkGSxH8L1nzCug
 4IB6LvljLixuVd+DDKZvD2CjZUPRLsmWxzEIClt+ATJ56LZYz6dAxq7lql4tEFkmX5X6
 l6nCvOthUFgH8Hnj2MKLpBmh7U8d412wcVaZgO5NmW+S/JdShYnMeoiEtGm6m1k3sc62
 whJ5zFDu18RR0ZkVuBAY1a4ak/VKH1HF1iEBDOCHEKhOYVmpn3NUPJoBo8ydsIeG5AEF 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j78pk816s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 14:24:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9FCA210002A;
 Tue, 30 Aug 2022 14:24:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98EB722789D;
 Tue, 30 Aug 2022 14:24:50 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:24:49 +0200
Message-ID: <bc705335-4d51-ab4c-5f59-5a02828c0ce4@foss.st.com>
Date: Tue, 30 Aug 2022 14:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-5-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220830120914.2329522-5-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andrew Jeffery <andrew@aj.id.au>, Simon Glass <sjg@chromium.org>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 4/4] gpio: sandbox: Add GPIOD_IS_AF for
 gpio configured in alternate function
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

Hi Patrice,

On 8/30/22 14:09, Patrice Chotard wrote:
> This allows to test if a pin's label if displayed using gpio_get_status()
> when this pin is configured in alternate function.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> ---
>
> (no changes since v1)
>
>   drivers/gpio/sandbox.c                  |  5 +++++
>   include/asm-generic/gpio.h              |  1 +
>   include/dt-bindings/gpio/sandbox-gpio.h |  3 +++
>   test/dm/gpio.c                          | 30 +++++++++++++++++++++++++
>   4 files changed, 39 insertions(+)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
