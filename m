Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79325A18BE0
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2025 07:20:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23D1AC78F76;
	Wed, 22 Jan 2025 06:20:53 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 802EDC78F6E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 06:20:45 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4afeccfeda2so3518651137.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 22:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737526844; x=1738131644;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N0y5rTPIweGann6oq8+gN36Tmp4hLahaeOE41Olhbu4=;
 b=uEb2PCDsdWNRqPSw+bSkFXppWjtfRs5ZTyvujMLXhMqmRS8RQxgwgB3pcOChfMXOeF
 ahlIDNZ0AwS3J+iuR0Vzk++50LO62b1Gq910F5IfKRku06KI0FQ3VNTOghK0IxH3s785
 CHeJXJICCkF1hKx+64ruD4WwhgrIR/0+SphaRgx3JNnK8o5PyuvlJ89Q0saiRJlU6Ci8
 LJOHsjcOVOfQxXXbKdVnCJYsOvlmrO1JYsBVwdRKICEbTPYkRUN+BjieYs7asJXr2iYe
 hQncM5oNrA6iHRecjjMnSFfPd3DEdhiTI2kO9brs3CWU7DHBPQQ7i3arMQYKcI/lnA2K
 M1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737526844; x=1738131644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N0y5rTPIweGann6oq8+gN36Tmp4hLahaeOE41Olhbu4=;
 b=W57g8DopwvYTnqxVmSv7DehEHsOKcjpl4QXSC/gCCMPP9KKL771zjYkoOaizhJNefM
 GqRglBfKX6b5z4afTPdDhOLVE2Z5rBpH57NG0fSKdl7ElTHwKfqH6+/DTTutydeoi54X
 LC3r3LrsFRu7n7y3GF/Cl4jejnqDJCBW5rxkRwzkJ383duwN7N/Vz//BwB05FumVfGQt
 96z+cLOw9j+nl3nMdUDo0/KcR5KGlDVDhsrMbr0JKl3hQo626RoBm0ZscNN80zqBhPUR
 aHVqGkAiX6pfFTuQj8ZK7H7ktW8F8FnoXqdOfJfS5I8X2niCYrtc5skwBsvmOXAH8/Rx
 ONWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgMMJUQ4vGKU6YG2nJY2sA/5It85Hm1zhQAzg5ZZQ0nBTDzptYusQyxx1TeuWKgVoZSfCasClav2Nx2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1eHEtLCva/eokXRc5tTAWdByraD5o45EQ29aBiGu/jKF6zfIl
 2xJdFuS0xTIH0BkRvs2R8qUsfsazBtDk/d++UgZaK+P+mr/dT1UGJsiersCNNw4XDyjjuK655Hn
 U5X5kpkVHUJQTAyQzmP1edVOHfvvmFrQnbRCM1Q==
X-Gm-Gg: ASbGncvsdChAY69QiCEPMw9y8vweY5aC7xgAv1vqhsw6fQbw14e3tzJy+bGyS9qMFfI
 xtNZd3w05yGoNgJSMYM8CUlTk/h2aNQ9mg7p+91Owg3xKaGLmvexFfg==
X-Google-Smtp-Source: AGHT+IGuBPZgRPp1D3nhedpEJ+seND1LTip07KKc3umKUovX44+1TS0FQNVMAO66mPMtnwzplrjZK+uGEPqB1vamZfg=
X-Received: by 2002:a05:6102:d86:b0:4b1:1b67:6a5c with SMTP id
 ada2fe7eead31-4b690c77495mr15728123137.18.1737526844294; Tue, 21 Jan 2025
 22:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20250121203147.4133618-1-trini@konsulko.com>
In-Reply-To: <20250121203147.4133618-1-trini@konsulko.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 22 Jan 2025 11:50:33 +0530
X-Gm-Features: AWEUYZkflzPz44vyXcXgSBu-GqKDVkI5YLQ-xuV2dLI26OqV7af_mUWc9sLhe-A
Message-ID: <CAFA6WYNNMvYNEdPRhaUWasgmS-74U3-sssoq8NYqON-t81NTLQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot-qcom@groups.io, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com,
 u-boot-amlogic@groups.io
Subject: Re: [Uboot-stm32] [PATCH] Squashed 'dts/upstream/' changes from
	9b6ba2666d63..8531b4b4988c
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

Hi Tom,

On Wed, 22 Jan 2025 at 02:01, Tom Rini <trini@konsulko.com> wrote:
>
> 8531b4b4988c Merge tag 'v6.13-rc7-dts-raw'
> [snip]
> git-subtree-dir: dts/upstream
> git-subtree-split: 8531b4b4988c2c9bddc90ea74f2d3e2dca9d5056
> ---
> This will bring us to the v6.13-dts tag of the devicetree-rebasing tree
> and so match v6.13 release. Changes and changelog omitted due to size,
> and everyone who is listed as a maintainer of a platform with
> OF_UPSTREAM enabled has been bcc'd, while other lists were cc'd to avoid
> being marked as spam, hopefully.
>

Glad to see DT subtree resync, it has been smooth up-revs then what I
had expected initially when we introduced it.

-Sumit

> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
