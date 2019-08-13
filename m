Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF1E8B43C
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Aug 2019 11:34:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B389C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Aug 2019 09:34:41 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB51BC35E02
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 09:34:40 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e12so25727084otp.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zNTrm8Zyd4TcmtsvHlEpgqbl6mVO86coLgxYwfszdJQ=;
 b=IqBXV1HnOg84ycVnQvGF9Hbyp3EtcfMeWfsRMoKQbGYgTcn9SNWApU4CCJuP5fzlJe
 FWM6mPrc1N8/C1TBirGlXd1+j3YWwNTC/lM8F98qEJK1l0rou/wyCx9AbiqsKDveZdZH
 RtFJMTN5Z6VHnENNa1iY6n2ZZ8bErrHFWRcSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zNTrm8Zyd4TcmtsvHlEpgqbl6mVO86coLgxYwfszdJQ=;
 b=SJtZ5YiLf3v+yC/MNG5wLHetSgYYcj55Hmm54l0FAptpZixw0B+7oy+UuqlpXowKfO
 fwX9QNO0htdNTEkYtWXQ1xaticuqdV8EZzbjnjbUnfPF3di6UPK/Ytu8VmiJM37r5eSZ
 36GomKvukcMuD9D0BUqrl+DCLB0/V/YROMzlNerMFf7RDqi1+U5EOYqgMP5Z+9p1Zz4m
 7iaCjRH612ub/qWrphIK49/4IG2+yyHLr2fhOMomS4DFL4YbGD+zfcT1HS+WCjOd5ZRW
 iOBdGQ230qVFExcMC4wRYOjzYhU85/T6HSMoGqpVZ7YlY1KkyISnJnNcQPUxxcrwVecY
 pgfw==
X-Gm-Message-State: APjAAAU/fOHJgjRKgQftYqXwyBExbqxBkib7f+oOdfDywjI5IraE/tEy
 Hs20mahPIE3uX8x6SzzVfLM0SxdimhBI5eZVrxMGgg==
X-Google-Smtp-Source: APXvYqwA4bPM4mjEvnIkVCwaX4lRG9Xwefx+PYwmmVkJ2hxJDSUUvlK5yuPmsOzJ88nfknCcdJYQ2ivHwE5bPw2ZWOU=
X-Received: by 2002:aca:be88:: with SMTP id o130mr812430oif.122.1565688878903; 
 Tue, 13 Aug 2019 02:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
 <1564751242-683-3-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564751242-683-3-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 13 Aug 2019 03:34:22 -0600
Message-ID: <CAPnjgZ3cVQqcHYz_+xBDY-bzM-rS+xzEB5UHJbZ26ieEu54uug@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Peng Fan <peng.fan@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Shawn Guo <shawn.guo@linaro.org>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Julius Werner <jwerner@chromium.org>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Chris Packham <judge.packham@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/5] image: add new "copro" image type
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

On Fri, 2 Aug 2019 at 07:07, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Define new image type for coprocessor images.
> It is used in FIT to identify the files loaded
> with remoteproc command (elf or bin).
>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/image.c  | 1 +
>  include/image.h | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
