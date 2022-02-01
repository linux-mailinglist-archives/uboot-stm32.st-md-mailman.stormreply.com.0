Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D917C4A548E
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Feb 2022 02:16:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92230C5EC43;
	Tue,  1 Feb 2022 01:16:42 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADA94C5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Feb 2022 01:16:41 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id h8so7119127qtk.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 17:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wWy/5QCQWQL2w5ywzkSXilSYcV4r5hW1Uav2/UIL4iI=;
 b=BT19VpSfEUrwoDBx2IM7YIVHEgkfeCIXXMGDjCqz3k4o378eGD3pPuSx6RmPpQ75J4
 Go1wgw/OOWiJT2Ck3F/z7p/5Hi0J+eloipiZCt8sgNZrwnsh8vs54ha8oSq/pLsi7FNp
 POqr6eh417hg0jHAWxGmrp50Mg/eer88auOoIwiv0T3GtQFqhy3zAehjSBF48VTKjIBK
 yfmmoLrz+KD71a8ZmBW5tnr11qGp58XVgYlWxaqN61DLsdWWw6TkQHCqMDqhoOaXTL90
 SimGexPU30NWEPbIShQ2RVs/UUrE7q8PcNmea+fbwAZvkivmSvCbh/PXr+IuAXrJST4z
 vaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wWy/5QCQWQL2w5ywzkSXilSYcV4r5hW1Uav2/UIL4iI=;
 b=gwRkwdjS8ShXwLGZoZ0jBvI3q7u90Uv3OyJ/TDF6or8IBjLXTjyP72ISG+6ko9inV5
 xNccPG+jJ7edJuL9oarGkDUsY8baORmp4hvjUUzBNJKFsQ48XFHHQ7wGz3n6mkhRApEk
 2ca1TzEkzIXqh3NtMgCz2xMwCTZMQMpDxS/aRUXYyIr3CTERUGH1moGRAjVzVKeY1dHZ
 feXL167WntXRFbQn8AIYOkCXVOamSL5FkNJkcv2kngmrVXHJZTR6Td3ue9JRr/cZfFu0
 I+vxFdg+taKlibhhtomtR6Yv9G5KmRf4OPpwn+n/56m+7gZasG1tQhRFWzsnUd5ISoXT
 62/A==
X-Gm-Message-State: AOAM531evALhrgk/zyAvn0dZfa0Uiwts2Ns9xcgpMOA6BsGHylRh0pVf
 JiPP1T6lyM6I2vv9J3XZ8z/FqhXYkXE=
X-Google-Smtp-Source: ABdhPJzA4FDxaSGxFXnXAi0PKWwdQT+nw79nzhht6CD7OE88ptNO2Fjd9IRcZzC8AucQUObNlNsz8g==
X-Received: by 2002:ac8:67d5:: with SMTP id r21mr17462171qtp.544.1643678200291; 
 Mon, 31 Jan 2022 17:16:40 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-137-133.washdc.fios.verizon.net.
 [108.18.137.133])
 by smtp.googlemail.com with ESMTPSA id c7sm7534311qtd.12.2022.01.31.17.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 17:16:40 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <fb2a3780-dd14-5125-250d-b9bbdb086a81@gmail.com>
Date: Mon, 31 Jan 2022 20:16:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
Content-Language: en-US
Cc: Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/4] cmd: clk: test the number of argument
 in setfreq command
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

On 1/31/22 11:21 AM, Patrick Delaunay wrote:
> Test the number of argument in setfreq command to avoid a crash when
> the command setfreq is called without argument:
> 
>    STM32MP> clk setfreq
>    data abort
>    pc : [<ddba3f18>]	   lr : [<ddba3f89>]
>    reloc pc : [<c018ff18>]	   lr : [<c018ff89>]
>    sp : dbaf45b8  ip : ddb1d859	 fp : 00000002
>    r10: dbb3fd80  r9 : dbb11e90	 r8 : ddbf38cc
>    r7 : ddb39725  r6 : 00000000	 r5 : 00000000  r4 : dbb3fd84
>    r3 : dbb3fd84  r2 : 0000000a	 r1 : dbaf45bc  r0 : 00000011
>    Flags: nzCv  IRQs off  FIQs off  Mode SVC_32 (T)
>    Code: 4dd3 1062 85a3 ddbd (7803) 2b30
>    Resetting CPU ...
> 
> Fixes: 7ab418fbe612 ("clk: add support for setting clk rate from cmdline")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   cmd/clk.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/cmd/clk.c b/cmd/clk.c
> index dbbdc31b35..52237791cf 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -120,6 +120,9 @@ static int do_clk_setfreq(struct cmd_tbl *cmdtp, int flag, int argc,
>   	s32 freq;
>   	struct udevice *dev;
>   
> +	if (argc != 3)
> +		return CMD_RET_USAGE;
> +
>   	freq = dectoul(argv[2], NULL);
>   
>   	dev = clk_lookup(argv[1]);
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
