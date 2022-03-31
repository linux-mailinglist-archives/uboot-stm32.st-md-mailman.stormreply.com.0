Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9654ED4B6
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Mar 2022 09:20:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DDC5C6046A;
	Thu, 31 Mar 2022 07:20:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 752C3C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Mar 2022 07:20:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22V7BVCa029218;
 Thu, 31 Mar 2022 09:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Y3VcB3mk8h7IZihMr19WdrwAp5PlVii2UVOEEWs35z4=;
 b=07az/pvi7IwcSXuTNm6oz4TqzzEeaxwTPDVClrlPEgXwN7DN9xsQxrOnKuyQPwyio05c
 jmSm73g16HlgQm3U4/fBFV5tg5AWhAjaMP+uKgoCy1O7oy41mRfrFcoj8bj2HXtPRMwz
 dDd2+GJwUCohxgHfKUO1MO9YW3dy+1XKGU4zMneyLEIUSz48trFrVXFAM0BKzqbsczvI
 zvPdJCnt6sQ0plFfeooGzb9E8s/W3HEXK1ZrIxKhtqV4HSdxbc0cZqYHJoTHT+1by3R5
 jZJjhes06wiQjTBmHM6wg1dpj/BidcWrHhsiPzLqNX/Sr2sOEK+aGTkn3O9jNQ0YGlzB MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1rudqc2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:20:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E06AC10002A;
 Thu, 31 Mar 2022 09:20:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D95B62138E2;
 Thu, 31 Mar 2022 09:20:32 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 31 Mar
 2022 09:20:32 +0200
Message-ID: <48d8af86-104b-06e1-9894-10a7cec229cb@foss.st.com>
Date: Thu, 31 Mar 2022 09:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, <u-boot@lists.denx.de>
References: <20220330220735.908616-1-trini@konsulko.com>
 <20220330220735.908616-9-trini@konsulko.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220330220735.908616-9-trini@konsulko.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_02,2022-03-30_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 09/25] stm32f429-discovery: Migrate
 CONFIG_*_LED out of CONFIG namespace
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

Hi Tom

On 3/31/22 00:07, Tom Rini wrote:
> These values are only used in one file, reference them more directly.
> 
> Cc: Kamil Lulko <kamil.lulko@gmail.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  board/st/stm32f429-discovery/led.c    | 19 +++++++++++--------
>  include/configs/stm32f429-discovery.h |  3 ---
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
> index 539c139bb5dd..8dda6a97bd1c 100644
> --- a/board/st/stm32f429-discovery/led.c
> +++ b/board/st/stm32f429-discovery/led.c
> @@ -8,30 +8,33 @@
>  #include <status_led.h>
>  #include <asm-generic/gpio.h>
>  
> +#define RED_LED			110
> +#define GREEN_LED		109
> +
>  void coloured_LED_init(void)
>  {
> -	gpio_request(CONFIG_RED_LED, "red led");
> -	gpio_direction_output(CONFIG_RED_LED, 0);
> -	gpio_request(CONFIG_GREEN_LED, "green led");
> -	gpio_direction_output(CONFIG_GREEN_LED, 0);
> +	gpio_request(RED_LED, "red led");
> +	gpio_direction_output(RED_LED, 0);
> +	gpio_request(GREEN_LED, "green led");
> +	gpio_direction_output(GREEN_LED, 0);
>  }
>  
>  void red_led_off(void)
>  {
> -	gpio_set_value(CONFIG_RED_LED, 0);
> +	gpio_set_value(RED_LED, 0);
>  }
>  
>  void green_led_off(void)
>  {
> -	gpio_set_value(CONFIG_GREEN_LED, 0);
> +	gpio_set_value(GREEN_LED, 0);
>  }
>  
>  void red_led_on(void)
>  {
> -	gpio_set_value(CONFIG_RED_LED, 1);
> +	gpio_set_value(RED_LED, 1);
>  }
>  
>  void green_led_on(void)
>  {
> -	gpio_set_value(CONFIG_GREEN_LED, 1);
> +	gpio_set_value(GREEN_LED, 1);
>  }
> diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
> index c9649a085ef1..21bab5aafd54 100644
> --- a/include/configs/stm32f429-discovery.h
> +++ b/include/configs/stm32f429-discovery.h
> @@ -17,9 +17,6 @@
>  
>  #define CONFIG_SYS_MAX_FLASH_SECT	12
>  
> -#define CONFIG_RED_LED			110
> -#define CONFIG_GREEN_LED		109
> -
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
>  #define CONFIG_SYS_CBSIZE		1024
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
