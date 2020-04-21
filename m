Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919D1B2E62
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 19:36:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11261C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:36:50 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46059C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 17:36:49 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m18so11840946otq.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8VReoifMNWboZ6k+EBkIanjszlj/rOZHnRwavDOCm88=;
 b=QrGphlhA/mVbBrBOtt+ys4ujnKlcf5wAQYmeOq2YCc8MFVGG3wnCpWV9UNBDAy9R+d
 5tkZ/+YHAbk7IwOGi+7jgMfYCn6rW01ZgpiBrEU0bkQO53XYhKmzcBvNlP11cAmQZwNL
 GU00ySWeTEaqXO1rGPD/PNXBqJ02ZtPynxKJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8VReoifMNWboZ6k+EBkIanjszlj/rOZHnRwavDOCm88=;
 b=r43eveRWEuAN2yJ0V48BNsgjUOUw3Z8elE2hewHqSZkouQL5uw8IkurpvpBayBJBH0
 MZHMLSxujsFOMGuvRsBB8/+xyehMPklJlpGyweVL5BVdkKTXDb5AiuVv92NB8ULPtMew
 VaoI8em5gS/fCyUAcL9Rp+PUEtHIIQeTd03u2gdaREcNhEOJPWSe6sFwMSYjIZAZoFXo
 2pNZuzOCgtFJuli7CaTL/BKcp7WQuJ+cVbMaOyiB0FGJtTp51M8dYm28ThQZVajB41pu
 tWgqO+6R0H+zD84V6cgUQmpQoS1/3aCFtJNGMJE61mzcSIizHWJwJYtmZzmS0OeTGykb
 Ej6g==
X-Gm-Message-State: AGi0PuZQ9jhW1iqzGyHSnmV1qzgtPpZmWlqQ8TIpBVA5MtzlXpDW2Eu9
 s42KCfXs3eJArddB7dWDqw0I9WytUAAbElyNDqd26Q==
X-Google-Smtp-Source: APiQypJ5MU7IxWn76VqHuVOSq7y51a/RQGFcQQdO+YxeEOG2MypOJ/EqEAyB1Cs7jxkWJFS1SnqkuRGbw9cgl2XRmfM=
X-Received: by 2002:a9d:107:: with SMTP id 7mr15383991otu.48.1587490607685;
 Tue, 21 Apr 2020 10:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200421140840.25729-1-patrice.chotard@st.com>
 <20200421140840.25729-2-patrice.chotard@st.com>
In-Reply-To: <20200421140840.25729-2-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2020 11:36:36 -0600
Message-ID: <CAPnjgZ1JcXVFyiWrNCe1chvUvR-KRXEmFvZ44iWnWU79H0eutw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] dm: core: give access to
	driver_check_compatible()
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

Hi Patrice,

On Tue, 21 Apr 2020 at 08:09, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> driver_check_compatible() can be useful in particular case,
> give access to this primitive
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>
>  drivers/core/lists.c |  6 +++---
>  include/dm/lists.h   | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>

Please see my comment on the other patch.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
