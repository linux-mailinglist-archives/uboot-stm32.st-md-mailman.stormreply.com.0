Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8F9EB001
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2024 12:37:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0826C78014;
	Tue, 10 Dec 2024 11:37:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9F47C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 11:37:01 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aa670ffe302so437068666b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 03:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733830621; x=1734435421;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MbdIDjHFBo+Vmazs5XSWzAjMFBDPf1XrmWrYS3FnVZI=;
 b=U0LKwY+kLYVLNmRYKStHCFDojJP5nzi8qD1IG0tjU9Vxa8qEMNYpGX/7kayQBQlgNl
 GJvskB5jkDh4RknZIOq07stucxTpJRBDa+VqjUKUQmDY6AE30hvvnUmA3oimpMcIBKOt
 SqBhwR0ucj4XcN0Ul8YwdsKsBy+AC9OWPNEowJ5i09ketHzGd793BhwYCGkMTl5uJFdi
 dXqcBdWnEmGGPGgEr/VKcMkKWsvITHD4TqEuIKGHVbLa3RHQxrVBqbOyabxtZGGownKb
 PUuqJ5wqR9X5h5M3zAA3sLEqHAIKQ1D1iYsrTHMfaYY6xJQ5I84YuVqmfO7oHr0SfqKf
 +c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733830621; x=1734435421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbdIDjHFBo+Vmazs5XSWzAjMFBDPf1XrmWrYS3FnVZI=;
 b=SlReofQOFAKfcpimPfmvKexj/vhPtVNzbhmh7mSXGAA+5NTyJY9xgCWK+k2E8Vjdzr
 wEr8Cer0UXNCaZeyZqf+J70shwv+TUI9plzf8uTzNH2/rKv/gFQU2Lf0Vf9RwHDQa4HL
 pb3Rr861UVzgNMNCglq12eDxfEEBl0YgWcYYxz4ykUvYE6v8r2eQCOa1GIKIkPOly83J
 JYzxmrNYmcQ1NpJ0yOVZ1P5GhreA2nnFdMDfRGeAOmlLUd4yu6nicmfxen5RIcjjZ2+U
 N5nNRw4aqEKSQui7MAGzovwho2xrCjVSjN1Dohs42r6SntxZau0VfegJVHYFOXazV10w
 P1TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaNFNDNUuQDtAAiOfY4wQA+JQ6AUP39G0rz6n8v44G2A84Mx5cN66+xMRpbsou3cPpMS743z8R5e0pIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznA7A7V0ZPtV7Cp38a8RIULCdVzM7A1c8IEHXT0Y6FXRqocOKm
 3eH+hvyAw3JRkPyOGv9pPDmGo+JPtX6VvOkRE3XzPfNZL25IR+NqIa6q+lWbckM=
X-Gm-Gg: ASbGncuPpkhWG3gBDdlqP6/eQsvq5c9vZ8Cf/L3BTLRMOI7ZsBRAYXx/A2zJ7LLlCNR
 L80UiWGxeKruCAsVDepxs/8P//3o7KDRwCG6qC9IJmYB71Diw39kxovqHW+qIOP/mrCXK+j6qI8
 sy7octla7tE+pgrVmmPXsffK6q5GqHJ8d8RQyDk6qGr7pIXbw84AowrkbMy7H3QikeSCIjNinh0
 RgtNOqmdhp+x0EUnIiPjiDM1YoM1SMNcGDMsy98rVe1GWKTSexEnQM8faajMw==
X-Google-Smtp-Source: AGHT+IGSkGAsUGQ/UtYKIT08e22va7Xz08q5s8CuIr9IjJOOyO/DpcXLfcQHF+9+OGnG0I+ciZ6FVg==
X-Received: by 2002:a17:906:2191:b0:aa5:43c4:da78 with SMTP id
 a640c23a62f3a-aa63a24bf41mr1446100766b.51.1733830621306; 
 Tue, 10 Dec 2024 03:37:01 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67770d264sm404065566b.64.2024.12.10.03.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 03:37:00 -0800 (PST)
Message-ID: <ae4d6b8c-8a3d-4a9a-88a0-67c1727ff06f@linaro.org>
Date: Tue, 10 Dec 2024 11:36:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
 <865xny69y1.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
 <8634j15t1y.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB869743652A0B3EC3335A9F9F98312@SA1PR12MB8697.namprd12.prod.outlook.com>
 <20241206163931.GS2457179@bill-the-cat>
 <SA1PR12MB86977B7233CE821D113F369C983D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <SA1PR12MB86977B7233CE821D113F369C983D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Cc: Jon Humphreys <j-humphreys@ti.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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



On 12/10/24 3:20 AM, Abbarapu, Venkatesh wrote:
> Tudor, Do you want me to implement separate 
> spi_nor_erase()/spi_nor_read()/spi_nor_write() for the parallel/stacked 
> configurations?

I lean towards it, it will spare maintainers and contributors of dealing
with this temporary situation. The core will look like before the
stacked/parallel support.

You'll have to introduce nor->erase(), nor->read(), nor->write(), define
your stacked/parallel methods in a dedicated file and set those function
pointers with what you need.

If Marek/Jagan finds the idea fine, go for it. I limit myself just to an
advisory role here.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
