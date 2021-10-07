Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C5425B56
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Oct 2021 21:09:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28660C597B2;
	Thu,  7 Oct 2021 19:09:38 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3668BC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 19:09:34 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so4230098ote.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Oct 2021 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IACTJiBcXiA7+Ff+xBg3vtrrbqdW0qXHpv3etNgzYm4=;
 b=LPz3QMY9IwFokLRHnoqSI2SN4dqmIyjfgcuK6TcH0lWA2dM+XbiHarEfkPa6baKP3x
 7EnXeXiji+NcG+nbQbPImy+1je3f4MkuzgNRJBlHmpC1Fd5k+3FMl25Z1s9f40wF+ac6
 b4Io11I81EYLLdk+4UNQAYylvAFnQ0FdYGdtiDoQT0yQvHV7mu9pbawWV6JXuHAMKFJd
 vUL4R1N0z69DToLQUMyIxFeok+7ADZUMKxxg0OP9aphLfAHv0/hnNLn6977+OfMGqmxS
 +c9XhQM8HELjWyy7UU7a784v3LX3ske6C+oIqFjBbOKJI9DjwpXxyIMir+huXq18Dnn9
 NJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IACTJiBcXiA7+Ff+xBg3vtrrbqdW0qXHpv3etNgzYm4=;
 b=GpUQRUoMdfRdnp3P7k63Pu6QRYAKbibsJBKTBO8JHkhr2Uor69lz7YN1pZn/MIrR8g
 t0hcfo9K4ivwkFmavca6fH+sS/cxKl8peovKy6eN6sFsSSJdReumzE9ATy0qWecyE9mR
 qARMqZAXz9KwAO0MxpEfIpIzb0buEj+0IFwC0dP1eRBglKIvcsrtjtmy+hEMsisdLcHE
 uN/hzTDane2oklG/EqtZW0y1OHMI3g/QcYfXzs5BNMvdxBo9AH6nd7gLb7zq0RMQgz+0
 bWHqxwFvFEI9wXopL18WTytutMnXX0OciZ55dEX5+GLUSeF59cS70r1pjs2n/3gpAc4e
 1mqA==
X-Gm-Message-State: AOAM5329i14agPGXYGZhy5kFjLWDaR/uFwESZrRCfIoR7F2c0+dUWOZa
 YgpWV7JrftnASXOGut3YrwkLhFJJf6c=
X-Google-Smtp-Source: ABdhPJyq1NpxMY2BRGfxoUqX6yxWNIslu20noIvWV8zD5yf6DrpMEnX30bq9SW8IClU161Se2G1A7g==
X-Received: by 2002:a9d:8e1:: with SMTP id 88mr5252623otf.339.1633633772863;
 Thu, 07 Oct 2021 12:09:32 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id s24sm51079otp.36.2021.10.07.12.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 12:09:32 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
 <20210907235933.2798330-4-mr.nuke.me@gmail.com>
 <4df50b6a-2536-dd89-cba3-f8362d5b1c7a@foss.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <45dc816b-78f2-1764-60ac-e9373f4ed540@gmail.com>
Date: Thu, 7 Oct 2021 14:09:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4df50b6a-2536-dd89-cba3-f8362d5b1c7a@foss.st.com>
Content-Language: en-US
Cc: etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH v2 03/11] stm32mp1: Add support for falcon
 mode boot from SD card
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



On 10/4/21 9:57 AM, Patrick DELAUNAY wrote:
> Hi,
> 
> => if OPTEE is loaded after SPL the U-Boot configuration change (running 
> in secure world or not)
> 
> I am starting to work on these issues in the branch
> 
> https://github.com/u-boot/u-boot/compare/master...patrickdelaunay:spl_optee_W2140 
> https://github.com/u-boot/u-boot/commit/04ad553e9c6bee62781460d2952df4962e58ae14 
> https://github.com/u-boot/u-boot/commit/aebb687a1557590bf070cf5d3478544ffff20ca1 
> 
> But it is still not working, OP-TEE is not correctly started

What do you mean by "OP-TEE is not correctly started". Here's the .its 
that I use for my FIT image. I hope this will be helpful.

/dts-v1/
;/ {
	description = "U-Boot fitImage for stm32mp1";
	#address-cells = <1>;
	images {	
		optee-1 {
			description = "OP-TEE secure world firmware";
			data = /incbin/("firmware/tee.bin");
			type = "tee";
			arch = "arm";
			os = "tee";
			compression = "none";
			load = <0xddffffe4>;
			entry = <0xde000000>;
			hash-1 {
				algo = "sha256";
			};
		};
		kernel-1 {
			description = "Linux kernel";
			data = /incbin/("kernel/zImage");
			type = "kernel";
			arch = "arm";
			os = "linux";
			compression = "none";
			load = <0xc2000040>;
			entry = <0xc2000040>;
			hash-1 {
				algo = "sha256";
			};
		};
		fdt-stm32mp157c-ev1.dtb {
			description = "Flattened Device Tree blob";
			data = /incbin/("kernel/stm32mp157c-ev1.dtb");
			type = "flat_dt";
			arch = "arm";
			compression = "none";
			hash-1 {
				algo = "sha256";
			};
		};
		fdt-stm32mp157c-dk2.dtb {
			description = "Flattened Device Tree blob";
			data = /incbin/("kernel/stm32mp157c-dk2.dtb");
			type = "flat_dt";
			arch = "arm";
			compression = "none";
			hash-1 {
				algo = "sha256";
			};
		};
		fdt-dk2-optee.dto {
			description = "Flattened Device Tree blob";
			data = /incbin/("firmware/dk2-optee.dto");
			type = "flat_dt";
			arch = "arm";
			compression = "none";
			hash-1 {
				algo = "sha256";
			};
		};
		fdt-dk2-can1-enable.dto {
			description = "Flattened Device Tree blob";
			data = /incbin/("firmware/dk2-can1-enable.dto");
			type = "flat_dt";
			arch = "arm";
			compression = "none";
			hash-1 {
				algo = "sha256";
			};
		};
		fdt-bootargs.dto {
			description = "Flattened Device Tree blob";
			data = /incbin/("firmware/bootargs.dto");
			type = "flat_dt";
			arch = "arm";
			compression = "none";
			hash-1 {
				algo = "sha256";
			};
		};
	};
	configurations {
		default = "secure-stm32mp157c-ev1.dtb";
		secure-stm32mp157c-ev1.dtb {
			description = "Linux with OP-TEE for stm32mp157c-ev1.dtb";
			kernel = "optee-1";
			fdt = "fdt-stm32mp157c-ev1.dtb", "fdt-bootargs.dto";
			loadables = "kernel-1";
			hash-1 {
				algo = "sha256";
			};
		};
		secure-stm32mp157c-dk2.dtb {
			description = "Linux with OP-TEE for stm32mp157c-dk2.dtb";
			kernel = "optee-1";
			fdt = "fdt-stm32mp157c-dk2.dtb", "fdt-bootargs.dto", 
"fdt-dk2-can1-enable.dto", "fdt-dk2-optee.dto";
			loadables = "kernel-1";
			hash-1 {
				algo = "sha256";
			};
		};
	};
};

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
