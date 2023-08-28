Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E730878A967
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Aug 2023 11:57:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B17E4C6A61D;
	Mon, 28 Aug 2023 09:57:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7BFC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 09:57:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37S8me1A009194; Mon, 28 Aug 2023 11:56:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=PC6TPzPrCBcdiuGGripm6JtJvwrxDSUkoLpkrkSdW5A=; b=Mi
 CS8mbEf1B0mBKejGDY4wbpQc1IMbY29rp6loiw+xh/CQ0BhjN79FsLo9gzPZJQP2
 ImcEiEVueTWUXYGjAUKHFy2eIIfGYo0fGTwJP8asdCggXhIQQ81MSGhneLWaWImr
 hjHpRKn/nCu8AQoYGebGdtv4CDa0djJ0zZHRvwdU/8vbi1QEiTo7ZokY8C3bIJEP
 ZIQWeYHD+QwZihNsfbKUdQmea9WVJqAYwo8f+KAXss19zjxV+qKdfXyGZCNpmlyR
 l0APNt6abNxzVUa2LfzqpCmPEjezVeopdIykQZZgayHktLDHlq3TR6AJZ1JqCD1/
 2zTyCT0i7nCKTVhJKCtw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq8qw6sj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 11:56:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30E59100056;
 Mon, 28 Aug 2023 11:56:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27AC621ADDB;
 Mon, 28 Aug 2023 11:56:50 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 28 Aug
 2023 11:56:49 +0200
Message-ID: <f2c32ba5-5000-6246-f989-bc453c2faa16@foss.st.com>
Date: Mon, 28 Aug 2023 11:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20230714152444.24395-1-ivprusov@sberdevices.ru>
 <20230714152444.24395-6-ivprusov@sberdevices.ru>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230714152444.24395-6-ivprusov@sberdevices.ru>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_07,2023-08-25_01,2023-05-22_02
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] cmd: clk: Use dump function from
	clk_ops
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



On 7/14/23 17:24, Igor Prusov wrote:
> Add another loop to dump additional info from clock providers that
> implement dump operation.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>  cmd/clk.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/cmd/clk.c b/cmd/clk.c
> index ff7c7649a1..55fb96e631 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -62,6 +62,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>  int __weak soc_clk_dump(void)
>  {
>  	struct udevice *dev;
> +	const struct clk_ops *ops;
>  
>  	printf(" Rate               Usecnt      Name\n");
>  	printf("------------------------------------------\n");
> @@ -69,6 +70,14 @@ int __weak soc_clk_dump(void)
>  	uclass_foreach_dev_probe(UCLASS_CLK, dev)
>  		show_clks(dev, -1, 0);
>  
> +	uclass_foreach_dev_probe(UCLASS_CLK, dev) {
> +		ops = dev_get_driver_ops(dev);
> +		if (ops && ops->dump) {
> +			printf("--------------------------\n");
> +			ops->dump(dev);
> +		}
> +	}
> +
>  	return 0;
>  }
>  #else

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
