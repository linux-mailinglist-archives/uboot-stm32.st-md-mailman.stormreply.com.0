Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8948F61F
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 10:26:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22A44C60461;
	Sat, 15 Jan 2022 09:26:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D172C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642238763;
 bh=PH8OWG/quTkWRPFziiUCdVxjpe8sw5VOndRRT9DoAd4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Wnnbi9KNRyp+X5KI4+u5Ee4acAefJzPOPc9b2tahmBLoTqyy5QVvPeHGWYhl9m58v
 iLr2q1wn9HwOKfIBGDH3aZdLOzXSZB3EpIv6El+BPyI2puCy9r6+kAhTgYMEZAP4vb
 iB55AFFVLZhW0bmmtKCEEylmA5TPCFEbYOuU6EBY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1mRfag3wmq-00jEbo; Sat, 15
 Jan 2022 10:26:03 +0100
Message-ID: <f698f821-8ae9-0cc8-c8ad-f6332ac90814@gmx.de>
Date: Sat, 15 Jan 2022 10:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220112105532.8.Ie3a53cf98ca389d4d05b0d353047f19ddc1c2530@changeid>
 <20220112105532.9.I34e44fa4682aa44191b0eb03369f2d925904f344@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105532.9.I34e44fa4682aa44191b0eb03369f2d925904f344@changeid>
X-Provags-ID: V03:K1:TWwDL3nd7W7GcQitk3M66t1Pe1OePFen3uFTDpq3Mbe0ua/waAZ
 txLIhLYp80RYuKrAL3pkg8rtIk4VkhpFzRYq+xMKhaFhEV6IxUv/sokc8avR5cRKuJVXaPR
 VyWqTgyytWSKJrM2KoBUzkYq3n51eaquqaCn4maNv5ahtUzzoRPnFK5j+Hoi6Wh4jG7JTln
 5H+CgkmGOrxngLhEHxifg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eY9O+miSoU4=:Uo/mJKKRKqFFD7MpU37iHx
 EvRFXpxKWRKeROrwLZIqoWVcwdLI8vyz1w/jpdTaVaEn0/PptKdX9hMiUjpiLueUIq7YwX1wg
 GprqC2d7Zi9afcynPzIJ9xzgMsmdWs5T7/5pIHXj4F4gUuCmqw/7Fhh500HQiWtzaWQRmwMEg
 dmq7tbLh4bsZfuNEBRXDomyiZ5YFLib+eFVVZn9MUO2th2iuZY1+P32bSORJS7okVdK8GV5yQ
 QiEmVOlLweytuc/VUVLcC+PK+4zkKRfVkcqdrfJpO7GhdXwssA0TI+1AYIlIit0JECrpBJMAC
 36k2j/dyfZw0POfvIEO5Hbsy1p4N2duhIMIqZiBaYPRLWOV1K1jFkrNKjpSN/A8nb2lChDnEM
 9g3vmOee6Fr3DhhsbKOpjHnuLTnLLQ4dg01yzTf/WqONefOrUNcGXaJBUpG2MAG+3uKHpB/NR
 DImrIQfVhIPjQh4z8z4DJq6NbfbNi6n352V5HjhP9ehsqKVaJO34FftHR8GslmhCqIjZVahij
 wtJGao7W+3x46slfk1Q40VsGV0FH251bRPcWLFU06rsRc7FTMGSAmekbbVlaQKczpRvj1P/ab
 mkk30iEdcjop5bNeEJq/uEG5crfThCTRNNIPDsW14BnVnmbWa4PrNNdMGAOEz+kDVCIDXBQLd
 xGgRAEYwRqDF0i5IuKYkArE+KJFqPxbvroWnC62nyVP5g/aA1t+ZhsEQ9iYI+GrWg6EQDIZmm
 Z3wU9V7SwdXmrkM7q7IDGRnF7TaYKM76vWm7qLrYOo7MgaZFwl+tKPNgQZX3gKqop4sXnbS9B
 1dMsNkeMCsuuchq4IHg7LvDf555lrcjNA1xGv8tDHpL2HQZFL0zpWP5EIh57oLlzp9f38swJ1
 8w5aPXwziDUkY0PBjRj6jWGJQEouTaLPrS4Azkj2LiTrTAvbFpsM29glbEZAlDGdElYQ7CvjH
 3ybT4pkA2Ig/OSEpiaR9LeDpZpoWx9wwmLVbK5GDhIKTdv6ZIinlcL0ezinxLXCVm5Xpi/0P5
 Bv0/G6LCQ4A42YpA1pXcobx95eLulTQu69nih7exgk0B6U2v5wha+FK5/mjqd/Bx9AbCvXDJW
 /QMtMbzCEzZ+lU=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 9/9] doc: add include/dm/fdtaddr.h to the
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

On 1/12/22 10:55, Patrick Delaunay wrote:
> Correct Sphinx style comments in include/dm/fdtaddr.h
> and add the devfdt API to the HTML documentation;
> these functions are NOT compatible with live tree.
>
> Signed-off-by: Patrick Delaunay<patrick.delaunay@foss.st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
