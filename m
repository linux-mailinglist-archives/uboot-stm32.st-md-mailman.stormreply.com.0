Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53785878FB2
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 09:29:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B22C6DD9D;
	Tue, 12 Mar 2024 08:29:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3859DC6B45E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 11:37:46 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33e9def4a6dso235594f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710157065; x=1710761865;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tv8/+F3EblhAh/v/gYVkxMXrp4vmZD9DcJq4EpmpuZI=;
 b=mcqJEgI4IdLcOCjWlSIV4Q93fjQGQfR1B+l126RXtb49elWDF9aq0m2I3Z4YVjeNGn
 7WSdqF2LI0EWLHdVGkulTAxRML4sZ7mPrFo7X9H07zoP7SGbodlpVkeTEPVLlP1nbems
 zNJYkw8xrMNxxrjdW/nKvmL7ulby35BoEfoJlcS8tbVCK2wEE1h3zPTDftTXLNZe+sY9
 UtNz1auOTEl8NyBhu8M/eWOWkD0oey43ruCPXKSbTs3Zb/DxUZmcqdioh8MEIOdu+2kd
 ErRbM8MJoDbUtE1SiyvNCTMzSN1+7LLcKV040wst0IyqC6Mnf25dWFRO8+ad2c4Ctxd2
 atyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710157065; x=1710761865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tv8/+F3EblhAh/v/gYVkxMXrp4vmZD9DcJq4EpmpuZI=;
 b=uN90i0S+ulobApiq9JF8iSzrFbl8IxPq2bPvkl56nxJSJCr/5b/YD/sP7rHjdNbBO9
 Z4JqMd8EIIFzomS8LI6mLyM+uCdzVbRA7KeWYNUoaW3MO/u7MUd5knCjfLxfxDx/JsWE
 pAkEBODT4IbqxgOdbX117LA15AkRZ8X0VfEuk45wnR6otUCzKA8cyGvjsMnusgVgLsAz
 IouRLSR8b3ilwUqesO89FvO6N+Xd9rA8V6yZvLinYV8ENipMwjvLKxvPWCFaCn2fY6Xb
 HHlFWt7VXApgQpcs4yPOF3+zICRblVgiJqz+etGP0/f2svJ4IC2HBXcLj+dtXrwip27f
 7o3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqcGgopAOwWCqzECqfYDHt6ROE0zvuCpaPedctfYRo0ijHV/0tLmDxRDRZDRS3qjaOZfgoDCQ/MnU2ueKUFKPIcLYcCN4uoFhD3KNnMDvUldKkqm8Gbsw4
X-Gm-Message-State: AOJu0YzV61o//Lel4KpWaux1VXiwcfAGflfoE4PgezNTrTzSZ2rWTFon
 4DPg+LoLbzcANCeZy/ZxcOFqIIXvRjopKVF6GAHPNU95Enk2mcbbcAjAP/oAvBk=
X-Google-Smtp-Source: AGHT+IGQexHfx8cJ8Tp56tn6mLaAiC1WbCv/VoFoG6n98LKs1BsJ0GdFw6AZkcvBS+DoYLtqfj6Isg==
X-Received: by 2002:adf:a4d5:0:b0:33e:726d:e963 with SMTP id
 h21-20020adfa4d5000000b0033e726de963mr4663494wrb.17.1710157065370; 
 Mon, 11 Mar 2024 04:37:45 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 g5-20020a5d6985000000b0033d6c928a95sm6272427wru.63.2024.03.11.04.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:37:45 -0700 (PDT)
Date: Mon, 11 Mar 2024 14:37:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <5b95fea0-581a-44e5-b275-09393b7b02a1@moroto.mountain>
References: <20240308133404.2619848-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240308133404.2619848-1-patrice.chotard@foss.st.com>
X-Mailman-Approved-At: Tue, 12 Mar 2024 08:29:26 +0000
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] fdt_support: fix
	fdt_copy_fixed_partitions function()
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

On Fri, Mar 08, 2024 at 02:34:04PM +0100, Patrice Chotard wrote:
> Move variable declaration at the beginning of the function.
> 

The problem, presumably, is that when declarations are in the middle of
a block then it triggers a GCC warning.  "declarations after code" or
whatever...  The commit message is not really clear.

And when I built this file I don't get a warning.  Is there a specific
config required to trigger the warning?

Btw, the Linux kernel recently silenced this warning because it doesn't
work well with the cleanup.h code...  It will be interesting to see if
people abandon this style guideline.

regards,
dan carpenter

> Fixes: 163c5f60ebb4 ("fdt_support: add fdt_copy_fixed_partitions function")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
