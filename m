Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC987E100F
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 Nov 2023 16:24:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DB9C6B457;
	Sat,  4 Nov 2023 15:24:36 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8D15C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Nov 2023 15:24:34 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-77896da2118so181031885a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Nov 2023 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699111473; x=1699716273;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dL2RkhTpXekTF8Ai6P/vNUxWJG4LIEK0Z2pmSz4RQmw=;
 b=aospBrFoDFd3H4fET2PslVguBlIKv/aDa7Ib89mZzV0HrWYbQj96re8/WWnNzBaLwd
 6214XpXqNdIc0pJL36ACNHw+CwD42kv4JqDsz/comxgcBsQEAGU4mWH5mOjmXHPLEnL0
 pBR7EIjDNvaCtqFxYRawkpi+6Xem5MxWAoYovWew2TKaoar9MokCW+aqAmul4uBXhTe5
 FFekUSAUhi+E5zDW+IF39MMuEjPmT19Em0mJtkghBzkVgn3r2MjOEwHl0EJcQQ5SUs3I
 3pNr7iEvtq5zMtM4Pczu5TsEx7qhJ7p0L10bvId25D1TmJXUizcHonPAcZKvIFay4okR
 k5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699111473; x=1699716273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dL2RkhTpXekTF8Ai6P/vNUxWJG4LIEK0Z2pmSz4RQmw=;
 b=ROxYvD6gc5OFP4ShsJCCW48r+Sld8EdAy4rewE+jnDCcj4l1DEKkBODRNvSCgnLDDr
 +qZWQFhT22xmnQpygvYbSpONQFhYRfIkDC6Nox0S0DZKBOshlDrYZtbjZz9zPiwYhbYN
 aqVIrw5fk3ryinKf3vTdVl7cZcyrfcXa2Srx4Pv+VYmv45xcgvCRdoE7s8qmLa1ikVGk
 xe/SCDAlypVh1EbPYKfkzLwxdI0aS/wym/ctoTXOiILlorPPhdHc90dCR42DfZEhyC1p
 0TiqK16LUEsDPle06rt5T/Rn0SxkPSh9cMSj230DjciNXsRI1sgEtmd9OOSlkJh06MmJ
 p9hg==
X-Gm-Message-State: AOJu0Yzg17U0aoVrhKKEgxXx8oHvMhSkwf+XnrxqNE6ZE3np4LJ3Z1Nj
 Xi2RfJFb6gkAKIfC/AtTLYk=
X-Google-Smtp-Source: AGHT+IE04H40wfAcCOloCWAQXdg+ekQlqAHdCNu7UL7HnxPjA6DF48eJgvCUGRHaYCI5YXknuhYV4w==
X-Received: by 2002:a05:6214:c88:b0:671:2c2f:4fe6 with SMTP id
 r8-20020a0562140c8800b006712c2f4fe6mr22660073qvr.46.1699111473641; 
 Sat, 04 Nov 2023 08:24:33 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 u14-20020a0cf88e000000b006585069e894sm1692509qvn.109.2023.11.04.08.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 08:24:33 -0700 (PDT)
Message-ID: <712d1810-93ad-8fd5-8989-1274b5ce49ce@gmail.com>
Date: Sat, 4 Nov 2023 11:24:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek
 <michal.simek@amd.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231102122017.56995-1-ivprusov@sberdevices.ru>
 <20231102122017.56995-6-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231102122017.56995-6-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v5 5/8] clk: Add dump operation to clk_ops
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

On 11/2/23 08:20, Igor Prusov wrote:
> This adds dump function to struct clk_ops which should replace
> soc_clk_dump. It allows clock drivers to provide custom dump
> implementation without overriding generic CCF dump function.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   include/clk-uclass.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/include/clk-uclass.h b/include/clk-uclass.h
> index a22f1a5d84..793bf14160 100644
> --- a/include/clk-uclass.h
> +++ b/include/clk-uclass.h
> @@ -25,6 +25,7 @@ struct ofnode_phandle_args;
>    * @set_parent: Set current clock parent
>    * @enable: Enable a clock.
>    * @disable: Disable a clock.
> + * @dump: Print clock information.
>    *
>    * The individual methods are described more fully below.
>    */
> @@ -39,6 +40,9 @@ struct clk_ops {
>   	int (*set_parent)(struct clk *clk, struct clk *parent);
>   	int (*enable)(struct clk *clk);
>   	int (*disable)(struct clk *clk);
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	int (*dump)(struct udevice *dev);
> +#endif
>   };
>   
>   #if 0 /* For documentation only */
> @@ -135,6 +139,17 @@ int enable(struct clk *clk);
>    * Return: zero on success, or -ve error code.
>    */
>   int disable(struct clk *clk);
> +
> +/**
> + * dump() - Print clock information.
> + * @clk:	The clock device to dump.
> + *
> + * If present, this function is called by "clk dump" command for each
> + * bound device.
> + *
> + * Return: zero on success, or -ve error code.
> + */
> +int dump(struct udevice *dev);

Actually, this should return void, since we don't do anything with the return code.

--Sean

>   #endif
>   
>   #endif

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
