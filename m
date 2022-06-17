Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E048854F207
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 09:34:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B35C5F1EE;
	Fri, 17 Jun 2022 07:34:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7F5AC5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 07:34:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6R3UC027749;
 Fri, 17 Jun 2022 09:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vhjarktLc3ghKyR7cpYVqml7ABxbKHTd4SnFF6WRgQ8=;
 b=1/R2gs6d/ybsYelgWGWfmWuTdD/UGAOZcHE+4Ak+wf2pOrsS0W3z0dqFNSQzP7HYHqbB
 zeR7rE9nwJOv0P31SQQkAWjarsMg3of2KNlYLp0ZGnkLVrevjiFvEY3C7EEaH4v6BlHr
 tJMjTnmYaTJMjhvO3BXEg4621j1h/uRrsFY3chUfv+SgbwYFbzkI+KMRNfP5LoewB5D2
 rzqeRaSe+W5y8vTlv9EflLSWLXNmCQ/Iw7FTk/x3Mba1mzjketJUdNWrt4At7vM/BboA
 sbLVZRX2ZRDZb13Hd8yvVkuhC0Q5h0Ax85tZySFfkaU1jZ/K4cdFCy6hJe4Ihq7PIdOA Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmbw0d0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 09:34:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4593100034;
 Fri, 17 Jun 2022 09:34:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FC6D2171E0;
 Fri, 17 Jun 2022 09:34:34 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 09:34:34 +0200
Message-ID: <74673666-ca80-486d-f553-594f23ea70d6@foss.st.com>
Date: Fri, 17 Jun 2022 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220616183756.1.Iec6058719fd0d81d3fe21d5607ed8125c1cc4039@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220616183756.1.Iec6058719fd0d81d3fe21d5607ed8125c1cc4039@changeid>
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_07,2022-06-16_01,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: fix the last
 character of dfu_alt_add third parameter
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

On 6/16/22 18:37, Patrick Delaunay wrote:
> The third parameter of dfu_alt_add(), the string description of alternate,
> is build in stm32prog_alt_add() with a unnecessary character ';' at the
> end of the string.
>
> This separator was required in the first implementation of
> dfu_alt_add() but is no more needed in the current implementation;
> this separator is managed only in dfu_config_interfaces() which call
> dfu_alt_add() for this parameter without this separator.
>
> And since the commit 53b406369e9d ("DFU: Check the number of arguments
> and argument string strictly"), this added character cause an error when
> the stm32prog command is executed because the third parameter of
> dfu_alt_add() must be a string with a numerical value; 's' must be NULL
> in the result of call in dfu_fill_entity_mmc():
>    third_arg = simple_strtoul(argv[2], &s, 0);
>
> Fixes: 53b406369e9d ("DFU: Check the number of arguments and argument string strictly")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)


Applied to u-boot-stm/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
