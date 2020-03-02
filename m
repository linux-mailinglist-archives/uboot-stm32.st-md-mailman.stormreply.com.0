Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DF117643B
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 20:47:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 955A2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 19:47:25 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA400C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 19:47:23 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z9so588548lfa.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2020 11:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iRS4ZMiwuSgB0e4zGtVwi+yRGS4dbhTHAwMJotDCpJk=;
 b=UwEUw4KvsA5Z1gEQeyDA6jwIstuDODVBD/LVIDKdNCQ70fTnU8EkofglWodjf0yMCN
 pUtUhRLIAjLrA5EhlGyHjvUKy9ifa5M4zXnfhs6nEhRIYOYDTfV4hL0kEy0o/K8v3AQV
 x6YdM21ZPbau/Il2zJ4iJbNA/zqVHj3oKKRA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRS4ZMiwuSgB0e4zGtVwi+yRGS4dbhTHAwMJotDCpJk=;
 b=pi1bjL2Ep2nIsLTS+4rsnROW+koBR5PAI+6CV8ZanKrOhThUVa+i+09Dl8Vr/uLsjD
 h7Aj1O3dkm8a8XqvXjSm8yGvFnVhw7euJWfBrX71aV2asILNH56LJGDxEonfJV5Uigb0
 +UxWcG7PfKZSp2ISfE0xxADhqj+U7rBT3O3duWSCbokTULUuyx/1nnHkEYwaoQLFI7EO
 nh7Q3Q8VTtkAcI9XOScs/PCfTEKtHPHweFmXTm+xUzZrYBVeEG6zZHHlahk0EeIHvTy8
 pYHYy2s1oZRMrMVrePJFu1NqJBG88A73/qCATg8mvEcQfKCtTYo+A8mkDQvo9EwnaV2t
 Q08Q==
X-Gm-Message-State: ANhLgQ0nFuBfP3D69dzkJOWXqFM/TG43928c+Sa8GDMFpAl0McGceUst
 1HEFpkokL9XHp+mc5VdG0y3juaPjpzWIkkn9AL2Faw==
X-Google-Smtp-Source: ADFU+vuT0J2k2pqze3+Mxu2v6JJfGCURWe6VCDE47le4hAKnweIUADVoH3TTyb32DuL2eVe0mI6lTSJOQpLs7cu4+g0=
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr422197lfg.209.1583178442625; 
 Mon, 02 Mar 2020 11:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20200302091241.10371-1-patrick.delaunay@st.com>
In-Reply-To: <20200302091241.10371-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 2 Mar 2020 12:47:00 -0700
Message-ID: <CAPnjgZ3mRWqRp5+-tCX3YmvFQo0C4nceBY5JoV54QYXUqZ1fpA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Thomas Hebb <tommyhebb@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: spl: update reference to
	driver-model/README.txt
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

On Mon, 2 Mar 2020 at 02:12, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update the reference in doc/README.SPL to a no more existing file:
> "driver-model/README.txt", it is changed to "doc/driver-model/design.rst".
>
> Adding the directory path /doc/ allows to check this reference with
> 'make refcheckdocs'.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  doc/README.SPL | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
