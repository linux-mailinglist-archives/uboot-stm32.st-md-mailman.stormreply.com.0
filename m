Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558948F60A
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 10:05:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E146AC60461;
	Sat, 15 Jan 2022 09:05:11 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92FAEC5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642237508;
 bh=Jp6vNJbBEXMVlOEP4vYsT6pKi3MBnOkSHO9QWtu+84U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=KwiKzXXH27yDF69Wj+JNNwz9dDXcUnOcoWMHJRES86gH3AH8YdZp2E2qUWxZzCBgn
 dbcl0v8rA/w/u/bGOKQdd93VDgV7tgtgZUGscKl2qeKr/qJJ+vS+OS15O+XeQAp6jb
 3cQI5t/tBYGlHEl8rlKA7HHYaV1UWk05ZnjLsVMU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1mHF820nX0-00rb7d; Sat, 15
 Jan 2022 10:05:08 +0100
Message-ID: <eab35aee-c020-5b78-8354-0b9aef99cef3@gmx.de>
Date: Sat, 15 Jan 2022 10:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
 <20220112105327.6.I4a89fcecefb6ef68311639140e0d0ef51c7207ca@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105327.6.I4a89fcecefb6ef68311639140e0d0ef51c7207ca@changeid>
X-Provags-ID: V03:K1:9aALouHI0HLfDy/5iJ1Xa4fGzZu1EvrFAt2KMq+wHFGVNM3tFvY
 amQ9Oqnjg3ozd5iiOzAR9PF/CaU132UHROwtHMIahayb1YUeG55msqvlS4J4xgq/hUahpm1
 0vAgiURXyQTINjDGiK0laGo1NMuV0scAWOPsF+aEHS7XnnVRqcTRpnsYov13vVi3gF/k0vm
 Y8HUAKidGbQsIReLQ4HtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNu0c3aM5Lo=:1Ip4hO9q/Rp2POnivK/d8S
 tTOd9CsWP6ULqpGSJGMfqBQOs169IECLfKi7ZmZ96APYevR9xaxEQrVfu1JrYc+xFL81vr6aU
 myjPfGnXSfHjH+7wnMMRl0V3WJVTkMYAGRt0hDCFiaMQoFtkW5kLFage2NNJyV/lfVbe9bfY3
 D8HQ9cAVtUdNCB/Yqt8DmH1cgEJfIval6mgzxmFIwcpEN2IvBXtn8PcJKMUleKV2xDTnWpwew
 jVkBcmK2QmLSacIWNz/YYo2x9J9ldFg2DQ6fxBdoiL25nY7/sfU8YtksKm6xVkAY4TsNrz9mn
 qwpn9ySoQ5hbfxPS0Ze01BFyDpSbnx47ZaBxy+NiL2CmHSiCjEciYawcsdkLdsCTuNUW2ojyb
 rp+/ugSc8DRjQ/YsD2N+oNGoDGEFDRtRWNHte31yeDh1XSS3iFHuHSIE7zpAjh1VtJEuZ0Rcb
 i3vCKC7x80LTvUtmPlumfZua3xwhH6Wu2sFerWmSllLdGgOhxjkDVIi6k6y9qvgiruH+PNLlz
 8KLcntU+YNmfXohs7/H0tnPaoR6H1AnXyhnOg1FSuZS7AR+zZl7LqnsXRa/xsipf0WmwvPc6Y
 uKyQt2TxdFlCEmEi28ETtKZZb6tz6ofv7CzD1CSaRoNJ6fTau01lkOdEcpLbmpGyyeJi9/wdt
 sBXayERoczcQc3A+/1mqJgJc3QyiThCGyON/duTnuZnanpC35IjGNzVIqZwBWEyXp/O5E+QJY
 73CEdo2jI00CEbxEWbkaLcpVjIcF95d6ForWsX0Qtpt7+nrH7sZaQSbBl+JDpEZlCArNPB2KF
 uvye8ji/sd5tYnr0Zny08dTUgOlzKwRRXbGYos2OXsqbO1Hb4juN3IT8T1aPBFuDdInRhB1TR
 zLIH6jsvcBP1ca0QidcMemIzHj/oFi8ND0f5TaD0cC7b7MJ4QIUG2MGWTMiCe36Xk3n/8s+95
 qfIhXFnQUKtv4G26+/8lrDOPynZKYEk3B/sh0JvCjlbkUDbls9kJlfx8+d2BcwEmjd/91TQNT
 pClG2Q9yh8mXRd2LDm6/9R8cAezwy+aZOL3/m2/GYdj/DHmJsxxwbjl4hcTTdXg3r9NmkDu2O
 6GH6JnzSyr1O7c=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 6/9] doc: add include/dm/devres.h to the
 HTML documentation
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

On 1/12/22 10:53, Patrick Delaunay wrote:
> Correct Sphinx style comments in include/dm/devres.h
> and add the driver model device resource API, devres_*(),
> to the HTML documentation.
>
> Signed-off-by: Patrick Delaunay<patrick.delaunay@foss.st.com>
> ---

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
